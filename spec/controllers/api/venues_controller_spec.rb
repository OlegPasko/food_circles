require 'spec_helper'

describe Api::VenuesController do

  describe "GET 'show'", type: :request do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
