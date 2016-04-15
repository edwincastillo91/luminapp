require 'rails_helper'

RSpec.describe "Univers", type: :request do
  describe "GET /univers" do
    it "works! (now write some real specs)" do
      get univers_path
      expect(response).to have_http_status(200)
    end
  end
end
