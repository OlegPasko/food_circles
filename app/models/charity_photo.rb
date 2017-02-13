class CharityPhoto < ApplicationRecord
  image_accessor :photo

  validates :photo, presence: true
  belongs_to :charity


end
