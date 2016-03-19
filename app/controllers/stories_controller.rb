# Front-end controller for stories
class StoriesController < InheritedResources::Base
  # GET /stories
  # GET /stories.json
  def index
    @stories ||= stories
    @rating = params[:rating]
    @starts_with = params[:starts_with]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.friendly.find(params[:id])
    @pages = @story.pages.ordered_for_story
    @people = @story.people.alphabetical.includes(:stories)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story }
    end
  end

  private

  def stories
    stories = Story.filter(params.slice(:rating, :starts_with))
    stories.with_pages.alphabetical.includes(:people).page params[:page]
  end
end
