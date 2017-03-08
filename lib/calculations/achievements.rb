# frozen_string_literal: true
module Calculations
  class Achievements
    def dt_min
      Date.new(2013, 11, 4)
    end

    def best_donors
      User.joins(payments: :offer).where('payments.amount > offers.price and payments.created_at > ?', dt_min).distinct.all
    end
  end
end
