# frozen_string_literal: true
class VenueTag < ApplicationRecord
  has_many :venue_taggables
  has_many :venues, through: :venue_taggables

  def as_json(_options = {})
    { id: id,
      name: name }
  end
end
