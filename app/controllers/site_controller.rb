# Front-end controller for home page
class SiteController < ApplicationController
  def index
    recent_stories = Story.with_pages.recent(4).includes(:people)
    stories = Story.with_pages.recent(24).offset(4).alphabetical.includes(:people)
    people = Person.recent(24).alphabetical

    respond_to do |format|
      format.html { render_index(recent_stories, stories, people) }
      format.json { render json: stories }
    end
  end

  private

  def render_index(recent_stories, stories, people)
    render 'site/index',
           locals: {
             recent_stories: recent_stories,
             stories:        stories,
             people:         people
           }
  end
end
