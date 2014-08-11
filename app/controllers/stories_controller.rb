class StoriesController < InheritedResources::Base
  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.filter(params.slice(:rating, :starts_with))
    @stories = @stories.with_pages.alphabetical
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
    @people = @story.people.alphabetical

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story }
    end
  end
end
