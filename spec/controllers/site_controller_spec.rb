# spec/controllers/site_controller_spec.rb
require 'spec_helper'

describe SiteController, :type => :controller do
  describe "GET #index" do
    describe "@recent_stories array" do
      it "includes stories with pages" do
        page = FactoryGirl.create(:page)
        get :index
        assigns(:recent_stories).should include(page.story)
      end
      it "excludes stories with no pages" do
        story = FactoryGirl.create(:story)
        get :index
        assigns(:recent_stories).should_not include(story)
      end
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
