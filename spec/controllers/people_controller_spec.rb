# spec/controllers/people_controller_spec.rb
require 'spec_helper'

describe PeopleController do
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
  describe "GET #show" do
    it "assigns the requested person to @person" do
      person = FactoryGirl.create(:person)
      get :show, id: person
      assigns(:person).should eq(person)
    end
    it "renders the :show view" do
      person = FactoryGirl.create(:person)
      get :show, id: person
      response.should render_template :show
    end
  end
end