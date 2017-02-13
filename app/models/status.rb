class Status < ApplicationRecord
  has_many :payments
  has_many :reservations
end
