class RemindList < ApplicationRecord
  include Validators

  validates :email, on: :update, email: true
  validates :email, on: :create, allow_nil: true, email: true
end
