# frozen_string_literal: true
class FollowUpNote < ApplicationRecord
  belongs_to :charity

  has_and_belongs_to_many :users

  attr_accessor :note, :charity_id

  validates :note, presence: true

  rails_admin do
    edit do
      configure :note do
        html_attributes rows: 20, cols: 50
      end
    end
  end
end
