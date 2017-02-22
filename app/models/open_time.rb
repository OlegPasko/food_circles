# frozen_string_literal: true
class OpenTime < ApplicationRecord
  # DEPRECATED, SOON TO BE DELETED

  belongs_to :openable, polymorphic: true

  validates_presence_of :start, :end

  def as_json(_options = {})
    { start: start,
      end: self.end }
  end
end
