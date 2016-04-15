require "rails_helper"

RSpec.describe UniversController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/univers").to route_to("univers#index")
    end

    it "routes to #new" do
      expect(:get => "/univers/new").to route_to("univers#new")
    end

    it "routes to #show" do
      expect(:get => "/univers/1").to route_to("univers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/univers/1/edit").to route_to("univers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/univers").to route_to("univers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/univers/1").to route_to("univers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/univers/1").to route_to("univers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/univers/1").to route_to("univers#destroy", :id => "1")
    end

  end
end
