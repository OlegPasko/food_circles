# frozen_string_literal: true
class CharitiesController < ApplicationController
  def show
    @charity = Charity.find(params[:id])
    if %w(json jsonp).include?(params[:format])
      render json: @charity, callback: params[:callback]
    end
    redirect_to edit_charity_registration_path(current_user)
  end

end
