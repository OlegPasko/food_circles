# frozen_string_literal: true
class ExperienceTag < ApplicationRecord
  # attr_accessible :title, :body
  has_many :experience_taggables
  has_many :venues, through: :experience_taggables

  def as_json(_options = {})
    { id: id,
      name: name }
  end
end
