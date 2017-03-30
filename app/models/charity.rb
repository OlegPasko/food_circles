# frozen_string_literal: true
class Charity < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  dragonfly_accessor :image
  dragonfly_accessor :logo
  dragonfly_accessor :photo

  default_scope { order('charities.order ASC') }

  belongs_to :charity
  belongs_to :region
  belongs_to :state
  has_many :payments
  has_many :follow_up_notes
  has_many :charity_photos

  CHARITY_TYPE_ENUM = %w(main extra).freeze

  validates :name, presence: true
  #validates :charity_type, presence: true, inclusion: { in: CHARITY_TYPE_ENUM }

  rails_admin do
    edit do
      configure :subdomain do
        label 'Desired Subdomain'
      end
      configure :charity_type, :enum do
        label 'Charity Type'
        enum do
          CHARITY_TYPE_ENUM
        end
      end
      configure :use_funds do
        label 'Use of Funds'
      end
    end
  end

  def self.active
    where(active: true)
  end

  def as_json(_options = {})
    { id: id,
      name: name,
      address: address,
      city: city,
      description: description,
      state: state.name,
      image: image.present? ? image.url : '' }
  end

  def full_address
    "#{address}, #{city}, #{state.name}"
  end

  def raw_msg_usefunds(amt)
    uf = use_funds.dup
    uf['%amt%'] = amt.to_s if uf.include? '%amt%'

    amt_mult = uf.match('%amt:([0-9\.]+)%')
    uf[amt_mult[0]] = (amt.to_f * amt_mult[1].to_f).to_s unless amt_mult.nil?

    uf_array = ['%s%', '%ren%']

    uf_array.each do |t|
      next unless uf.include? t
      uf[t] = if amt > 1
                t[1...-1]
              else
                ''
              end
    end

    uf
  end

  def msg_usefunds(amt)
    raw = raw_msg_usefunds(amt)

    ActionController::Base.helpers.strip_tags(raw)
  end
end
