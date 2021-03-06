# Front-end controller for people
class PeopleController < InheritedResources::Base
  # GET /people
  # GET /people.json
  def index
    @people = Person.alphabetical.page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.friendly.find(params[:id])
    @stories = @person.stories.with_pages.alphabetical.includes(:people)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end
end
