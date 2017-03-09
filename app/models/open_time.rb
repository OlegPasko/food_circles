# frozen_string_literal: true
class OpenTime < ApplicationRecord
  # DEPRECATED, SOON TO BE DELETED

  belongs_to :openable, polymorphic: true

  validates :start, :end, presence: true

  def as_json(_options = {})
    { start: start,
      end: self.end }
  end
end
