# Front-end controller for people
class PeopleController < ApplicationController
  def index
    people = repo.all.page params[:page]
    respond_to do |format|
      format.html { render_index(people) }
      format.json { render json: people }
    end
  end

  def show
    person = repo.find(params[:id])
    respond_to do |format|
      format.html { render_show(person) }
      format.json { render json: person }
    end
  end

  private

  def repo
    @people_repo ||= PeopleRepo.new
  end

  def render_index(people)
    render 'people/index', locals: { people: people }
  end

  def render_show(person)
    render 'people/show',
           locals: {
             person: person,
             stories: person.stories.with_pages.alphabetical.includes(:people)
           }
  end
end
