# frozen_string_literal: true
class Venue < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  extend FriendlyId
  include Validators
  include AlwaysOpen

  belongs_to :state
  belongs_to :time_zone
  belongs_to :user
  has_many :offers, dependent: :destroy

  # DEPRECATED, SOON TO BE DELETED
  # has_many :open_times, as: :openable, dependent: :destroy

  has_many :venue_taggables, dependent: :destroy
  has_many :venue_tags, through: :venue_taggables
  has_many :reviews
  has_many :notification_requests
  has_many :watching_users, through: :notification_requests, source: :user
  has_many :social_links
  has_many :experience_taggables
  has_many :experience_tags, through: :experience_taggables

  friendly_id :name, use: :slugged

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode

  require 'open-uri'
  require 'json'

  # PLACES_KEY = "AIzaSyA3XZ8R5H4Q8xsnaMMJKIPYxiBadpAt_a4"
  # SRID = 4326

  # set_rgeo_factory_for_column(:latlon,
  #                            RGeo::Geographic.spherical_factory(srid: SRID))

  dragonfly_accessor :main_image
  dragonfly_accessor :outside_image
  dragonfly_accessor :restaurant_tile_image
  dragonfly_accessor :timeline_image

  validates :name, presence: true
  validates :email, on: :update, 'validators/email': true
  validates :email, on: :create, allow_nil: true, 'validators/email': true

  # before_save :update_latlon, if: :dirty_latlon?
  after_save :notify_watching_users_about_new_vouchers, if: :has_new_vouchers?
  after_create :ensure_always_open

  scope :visible, -> { where(visible: true) }

  rails_admin do
    show do
      include_all_fields
      field :latitude
      field :longitude
    end

    edit do
      include_all_fields
      field :latitude
      field :longitude
    end
  end

  def num_vouchers
    if active
      vouchers_available.to_i
    else
      0
    end
  end

  def has_new_vouchers?
    vouchers_available_changed? &&
      vouchers_available_change.first &&
      vouchers_available_change.first < vouchers_available_change.last
  end

  def has_vouchers?
    num_vouchers > 0
  end

  def sold_out?
    !has_vouchers?
  end

  def notify_watching_users_about_new_vouchers
    watching_users.each do |watching_user|
      UserMailer.notification_about_available_vouchers(watching_user, self).deliver
    end
    notification_requests.destroy_all
  end

  def as_json(options = {})
    data = {
      id: id,
      name: name,
      address: address,
      city: city,
      # longitude: longitude,
      # latitude: latitude,
      description: description,
      neighborhood: neighborhood,
      phone: phone,
      state: state.nil? ? '' : state.name,
      web: web,
      zip: zip,
      rating: rating,
      tags: venue_tags,
      open_times: times || 'Not Available',
      reviews: reviews.first(3),
      main_image: (main_image ? main_image.url : ''),
      timeline_image: (timeline_image ? timeline_image.url : ''),
      outside_image: (outside_image ? outside_image.url : ''),
      restaurant_tile_image: (restaurant_tile_image ? restaurant_tile_image.url : ''),
      # start: (available? ? 'Later Tonight' : open_at),
      # end: close_at,
      vouchers_available: num_vouchers,
      # distance: (options[:lat] ? distance(options[:lat], options[:lon]) : ''),
      social_links: social_links,
      slug: slug,
      device_id: device_id
    }
    data[:offers] = if options[:all]
                      offers
                    elsif options[:not_available]
                      offers.not_available
                    else
                      offers.currently_available
                    end.order(:min_diners)

    data
  end

  def self.active
    where(active: true)
  end

  # def open_at(t = Time.now)
  #   st = ((t.beginning_of_day - t.beginning_of_week) / 60) + 300
  #   et = ((t.end_of_day - t.beginning_of_week) / 60) + 300

  #   o = offers.first.open_times.where('open_times.start BETWEEN :st AND :et', st: st, et: et, id: id)
  #   o = o[0] if o[0]

  #   return 'Later Tonight' if o.class.name != 'OpenTime'
  #   "#{to_read(o.start)} - #{to_read(o.end)}"
  # end

  def open_at2(t = Time.now)
    st = ((t.beginning_of_day - t.beginning_of_week) / 60) + 300
    et = ((t.end_of_day - t.beginning_of_week) / 60) + 300

    o = offers.first.open_times.where('open_times.start BETWEEN :st AND :et', st: st, et: et, id: id)

    o
  end

  def close_at(t = Time.now)
    t = ((t - t.beginning_of_week) / 60) + 300

    o = OpenTime
        .where("open_times.openable_type = 'Offer' AND :t BETWEEN open_times.start AND open_times.end", t: t)
    o.each do |e|
      offer = Offer.find_by id: e.openable_id
      if offer && offer.venue_id == id
        o = e
        break
      end
    end

    return 'Later Tonight' if !o || o.class.name != 'OpenTime'
    to_read(o.end)
  end

  # def distance(lat, lon)
  #  point_a = Venue.rgeo_factory_for_column(:latlon).point(lon, lat)
  #  point_b = Venue.rgeo_factory_for_column(:latlon).point(latlon.x, latlon.y) # to workaroud the fact that the db has switched lon, lat
  #  ((point_a.distance(point_b) / 1000) * 0.621371192).round(2).to_s + "mi"
  # end

  def full_address
    addr = "#{address}, #{city}"
    addr += ", #{state.name}" if state
    addr
  end

  def available?
    t = ((Time.now - Time.now.beginning_of_week) / 60) + 300
    v = Offer.joins(:open_times)
             .where('offers.venue_id = :id AND :now BETWEEN open_times.start AND open_times.end', now: t, id: id)
    v.count != 0
  end

  def available_voucher(v); end

  def self.currently_available(time = Time.now)
    t = ((time - time.beginning_of_week) / 60) + 300
    Venue.joins(offers: :open_times)
         .where('? BETWEEN open_times.start AND open_times.end', t)
         .distinct
  end

  # def self.currently_available_with_location(lat, lon, time=Time.now)
  #  t = ((time - time.beginning_of_week) / 60) + 300
  #  sql_dist = "ST_Distance(venues.latlon, 'POINT(#{lat} #{lon})')"
  #
  #  Venue.joins(offers: :open_times).
  #    where("#{sql_dist} < 50000 AND ? BETWEEN open_times.start AND open_times.end", t).
  #    order("#{sql_dist}").
  #    group("venues.id")
  # end

  def self.not_available
    t = ((Time.now - Time.now.beginning_of_week) / 60) + 300
    day_end = ((Time.now.end_of_day - Time.now.beginning_of_week) / 60) + 300
    Venue.joins(offers: :open_times)
         .where('open_times.start BETWEEN :now AND :day_end', now: t, day_end: day_end)
         .distinct
  end

  # def self.not_available_with_location(lat, lon, time=Time.now)
  #  t = ((time - time.beginning_of_week) / 60) + 300
  #  e = ((time.end_of_day - time.beginning_of_week) / 60) + 300
  #  sql_dist = "ST_Distance(venues.latlon, 'POINT(#{lat} #{lon})')"
  #  Venue.joins(offers: :open_times).
  #    where("#{sql_dist} < 50000 AND open_times.start BETWEEN :now AND :e", {now: t, e: e}).
  #    order("#{sql_dist}").
  #    group("venues.id")
  # end

  # Returns all venues within the specified radius. Note radius is in meters
  def self.within_radius_of_location(latitude, longitude, radius = 80467.2)
    return Venue.scoped unless latitude.present? && longitude.present?
    Venue.near([latitude, longitude], radius)
  end



  def getReviews
    return unless reference
    query = "https://maps.googleapis.com/maps/api/place/details/json?reference=#{reference}&sensor=true&key=#{PLACES_KEY}"
    j = JSON.parse(open(query).read)

    j['result']['reviews'].each do |r|
      reviews.create(author_name: r['author_name'], content: r['text'], rating: r['aspects'][0]['rating'], time: r['time'])
    end
  end

  private

  # def dirty_latlon?
  #  if latlon.present?
  #    lat != latlon.lat || lon != latlon.lon
  #  elsif self.new_record?
  #    lat.present? && lon.present?
  #  end
  # end

  # def update_latlon
  #  new_latlon = Venue.rgeo_factory_for_column(:latlon).point(lon, lat)
  #  self.latlon = new_latlon
  # end

  def to_read(m)
    h, m = (m - 300).divmod 60
    d, h = h.divmod 24
    h = 12 if h == 0

    if h > 12
      return "#{sprintf '%02d', h - 12}:#{sprintf '%02d', m}pm"
    else
      return "#{sprintf '%02d', h}:#{sprintf '%02d', m}am"
    end
  end

  def self.updateRatings
    Venue.all.find_each do |v|
      query = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{v.name} #{v.address} #{v.city} #{v.state.name}&sensor=true&key=#{PLACES_KEY}".gsub(/\s/, '+').delete("'")
      j = JSON.parse(open(query).read)

      next if j['status'] == 'ZERO_RESULTS'

      loc = j['results'][0]['geometry']['location']
      v.latlon = "SRID=#{SRID};POINT (#{loc['lat']} #{loc['lng']})"
      v.rating = j['results'][0]['rating'].to_f
      v.reference = j['results'][0]['reference']

      v.save
      v.getReviews
    end
  end

  def self.with_display_offers
    joins(:offers).distinct
  end
end
