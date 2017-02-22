# frozen_string_literal: true
class Reservation < ApplicationRecord
  belongs_to :charity
  belongs_to :offer
  belongs_to :user
  belongs_to :venue

  def as_json(_options = {})
    { id: id,
      coupon: coupon,
      name: name,
      success: true }
  end

  def self.weekly_update
    auto_emails = Reservation.all(select: 'created_at')

    UserMailer.weekly_mail.deliver
  end
end
