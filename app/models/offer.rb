# frozen_string_literal: true
class Offer < ApplicationRecord
  include AlwaysOpen

  belongs_to :venue

  # DEPRECATED, SOON TO BE DELETED
  has_many :open_times, as: :openable, dependent: :destroy

  has_and_belongs_to_many :category
  has_many :payments

  attr_accessor :image, :name, :venue_id, :category_ids, :price, :original_price, :total, :available, :min_diners, :details
  attr_accessor :image

  has_attached_file :image, styles: {
    deal: '253x163#',
    timeline: '205x155#',
    medium: '300x300>'
  }

  after_create :ensure_always_open

  def as_json(_options = {})
    { id: id,
      title: name,
      details: details,
      minimum_diners: min_diners,
      times: times || 'Not Available',
      original_price: original_price,
      price: price }
  end

  def self.currently_available(time = Time.now)
    t = ((time - time.beginning_of_week) / 60) + 300
    joins(:open_times)
      .where('? BETWEEN open_times.start AND open_times.end', t)
      .distinct
  end

  def self.not_available
    t = ((Time.now - Time.now.beginning_of_week) / 60) + 300
    day_end = ((Time.now.end_of_day - Time.now.beginning_of_week) / 60) + 300
    joins(:open_times)
      .where('open_times.start BETWEEN :now AND :day_end', now: t, day_end: day_end)
      .distinct
  end
end
