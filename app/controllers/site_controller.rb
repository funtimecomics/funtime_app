# Front-end controller for home page
class SiteController < InheritedResources::Base
  # GET /pages
  # GET /pages.json
  def index
    @recent_stories = Story.with_pages.recent(4).includes(:people)
    @most_recent_issue = Issue.most_recent
    @stories = Story.with_pages.recent(23).offset(4).alphabetical.includes(:people)
    @people = Person.recent(23).alphabetical

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end
end
