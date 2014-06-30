class PeopleController < InheritedResources::Base
  # GET /people
  # GET /people.json
  def index
    @people = Person.alphabetical

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])
    @stories = @person.stories.with_pages.alphabetical

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end
end
