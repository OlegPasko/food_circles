# frozen_string_literal: true
class Api::CharitiesController < ApplicationController
  def show
    @charities = Charity.active.all
    return_arr = []
    @charities.each do |c|
      return_arr << {
        id: c.id,
        name: c.name,
        description: c.description,
        use_funds: c.use_funds
      }
    end

    render json: { error: false, content: return_arr }
  rescue Exception => e
    render(json: { error: true, description: 'Internal Server Error.' }, status: 503) && (return)
  end
end
