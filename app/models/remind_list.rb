class RemindList < ApplicationRecord
  include Validators

  # validates :email, on: :update, email: true
  # validates :email, on: :create, allow_nil: true, email: true
  validates :email, on: :update, 'validators/email': true
  validates :email, on: :create, allow_nil: true, 'validators/email': true
end
