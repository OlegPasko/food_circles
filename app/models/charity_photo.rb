class CharityPhoto < ApplicationRecord
  dragonfly_accessor :photo

  validates :photo, presence: true
  belongs_to :charity


end
