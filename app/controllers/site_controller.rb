class SiteController < InheritedResources::Base
  # GET /pages
  # GET /pages.json
  def index
    @recent_stories = Story.alphabetical.recent(4)
    @stories = Story.alphabetical.recent(24).offset(4)
    @people = Person.alphabetical.recent(24)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end

  # def publications
  # end

  # def workshops
  # end

  # def submissions
  # end

end
