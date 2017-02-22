# frozen_string_literal: true
class ExternalUID < ApplicationRecord
  belongs_to :user

  validates :uid, uniqueness: true, presence: true
end
