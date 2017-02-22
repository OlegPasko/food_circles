# frozen_string_literal: true
class Status < ApplicationRecord
  has_many :payments
  has_many :reservations
end
