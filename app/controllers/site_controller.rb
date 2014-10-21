class SiteController < InheritedResources::Base
  # GET /pages
  # GET /pages.json
  def index
    @recent_stories = Story.with_pages.recent(4)
    @stories = Story.with_pages.recent(24).offset(4).alphabetical
    @people = Person.recent(24).alphabetical

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
