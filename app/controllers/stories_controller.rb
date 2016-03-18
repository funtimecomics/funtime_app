# Front-end controller for stories
class StoriesController < ApplicationController
  # GET /stories
  # GET /stories.json
  def index
    rating = params[:rating]
    starts_with = params[:starts_with]
    stories = repo.filter(rating: rating, starts_with: starts_with).page params[:page]
    respond_to do |format|
      format.html { render_index(stories, rating, starts_with) }
      format.json { render json: stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    story = repo.find(params[:id])
    respond_to do |format|
      format.html { render_show(story) }
      format.json { render json: story }
    end
  end

  private

  def repo
    @stories_repo ||= StoriesRepo.new
  end

  def render_index(stories, rating, starts_with)
    render 'stories/index',
           locals: {
             stories: stories,
             rating: rating,
             starts_with: starts_with
           }
  end

  def render_show(story)
    render 'stories/show',
    locals: {
      story: story,
      pages: story.pages.ordered,
      people: story.people.alphabetical.includes(:stories)
    }
  end
end
