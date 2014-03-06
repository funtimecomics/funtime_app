# spec/controllers/site_controller_spec.rb
require 'spec_helper'

describe SiteController do
  describe "GET #index" do
    it "populates an array of stories" do
      story = FactoryGirl.create(:story)
      get :index
      assigns(:stories).should eq([story])
    end
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end
  describe "GET #index" do
    it "populates an array of people" do
      person = FactoryGirl.create(:person)
      get :index
      assigns(:people).should eq([person])
    end
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end
end