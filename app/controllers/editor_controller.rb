# frozen_string_literal: true
class EditorController < ApplicationController
  def show
    @venue = Venue.find(params[:id])
  end
end
