# frozen_string_literal: true
class RestaurantsController < ApplicationController
  def index
    enqueue_mix_panel_event 'Visits Restaurants Get Involved Sub Page'
  end

  def new

  end

  def create
    enqueue_mix_panel_event 'Submits Restaurants Get Involved Form'
    if params[:email]
      if valid_email?(params[:email])
        signup
      else
        flash[:error] = 'Invalid email address.'
      end
    end
  end

  def signup
    UserMailer.restaurant_notify(restorant_params).deliver
    UserMailer.restaurant_signup(restorant_params).deliver

    @notification = Notification.create
    @notification.content = "Name: #{name}, Email: #{email}"
    @notification.ticker = 'A restaurant signup'
    @notification.save
  end

  def valid_email?(email)
    valid = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    email.present? && (email =~ valid)
  end

  private

  def restorant_params
    params.require(:restaurants).require(:name, :email)
  end
end
