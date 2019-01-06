# spec/controllers/people_controller_spec.rb
require 'spec_helper'

describe PeopleController, type: :controller do
  describe 'GET #index' do
    it 'populates an array of people' do
      person = FactoryBot.create(:person)
      get :index
      expect(assigns(:people)).to eq([person])
    end
    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end
  describe 'GET #show' do
    it 'assigns the requested person to @person' do
      person = FactoryBot.create(:person)
      get :show, params: { id: person.id }
      expect(assigns(:person)).to eq(person)
    end
    it 'renders the :show view' do
      person = FactoryBot.create(:person)
      get :show, params: { id: person.id }
      expect(response).to render_template :show
    end
  end
end
