require "rails_helper"

RSpec.describe NewsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/news").to route_to("news#index")
    end

    it "routes to #quick_labelling" do
      expect(:get => "/news/quick_labelling").to route_to("news#quick_labelling")
    end

    it "routes to #new" do
      expect(:get => "/news/new").to route_to("news#new")
    end

    it "routes to #show" do
      expect(:get => "/news/1").to route_to("news#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/news/1/edit").to route_to("news#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/news").to route_to("news#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/news/1").to route_to("news#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/news/1").to route_to("news#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/news/1").to route_to("news#destroy", :id => "1")
    end

  end
end
