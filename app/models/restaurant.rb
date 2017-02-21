# frozen_string_literal: true
class Restaurant < ApplicationRecord
  # attr_accessor :name, :email

  def new
    @restaurant = Restaurant.new
  end
end
