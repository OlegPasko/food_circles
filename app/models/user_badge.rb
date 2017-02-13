class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge
  attr_accessor :sent_email
end
