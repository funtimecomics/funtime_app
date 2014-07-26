# spec/controllers/stories_controller_spec.rb
require 'spec_helper'

describe StoriesController, :type => :controller do
  describe "GET #index" do
    describe "@stories array" do
      it "includes stories with pages" do
        page = FactoryGirl.create(:page)
        get :index
        assigns(:stories).should include(page.story)
      end
      it "excludes stories with no pages" do
        story = FactoryGirl.create(:story)
        get :index
        assigns(:stories).should_not include(story)
      end
    end
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end
  describe "GET #show" do
    it "assigns the requested story to @story" do
      story = FactoryGirl.create(:story)
      get :show, id: story.id
      assigns(:story).should eq(story)
    end
    it "renders the :show view" do
      story = FactoryGirl.create(:story)
      get :show, id: story.id
      response.should render_template :show
    end
  end
end
