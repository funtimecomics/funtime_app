class SiteController < InheritedResources::Base
  # GET /pages
  # GET /pages.json
  def index
    @stories = Story.all
    @people = Person.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end

  def publications
  end

  def workshops
  end

  def contact
  end

end
