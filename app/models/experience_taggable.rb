# frozen_string_literal: true
class ExperienceTaggable < ApplicationRecord
  # attr_accessible :title, :body
  belongs_to :experience_tag
  belongs_to :venue
end
