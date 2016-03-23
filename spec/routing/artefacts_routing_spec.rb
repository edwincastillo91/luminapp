require "rails_helper"

RSpec.describe ArtefactsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/artefacts").to route_to("artefacts#index")
    end

    it "routes to #new" do
      expect(:get => "/artefacts/new").to route_to("artefacts#new")
    end

    it "routes to #show" do
      expect(:get => "/artefacts/1").to route_to("artefacts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/artefacts/1/edit").to route_to("artefacts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/artefacts").to route_to("artefacts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/artefacts/1").to route_to("artefacts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/artefacts/1").to route_to("artefacts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/artefacts/1").to route_to("artefacts#destroy", :id => "1")
    end

  end
end
