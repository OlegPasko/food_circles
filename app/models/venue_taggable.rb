class VenueTaggable < ApplicationRecord
  belongs_to :venue_tag
  belongs_to :venue
end
