# spec/controllers/stories_controller_spec.rb
require 'spec_helper'

describe StoriesController, :type => :controller do
  describe "GET #index" do
    describe "@stories array" do
      it "includes stories with pages" do
        page = FactoryGirl.create(:page)
        get :index
        expect(assigns(:stories)).to include(page.story)
      end
      it "excludes stories with no pages" do
        story = FactoryGirl.create(:story)
        get :index
        expect(assigns(:stories)).not_to include(story)
      end
    end
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end
  describe "GET #show" do
    it "assigns the requested story to @story" do
      story = FactoryGirl.create(:story)
      get :show, id: story.id
      expect(assigns(:story)).to eq(story)
    end
    it "renders the :show view" do
      story = FactoryGirl.create(:story)
      get :show, id: story.id
      expect(response).to render_template :show
    end
  end
end
