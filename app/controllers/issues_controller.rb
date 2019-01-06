# frozen_string_literal: true

class IssuesController < InheritedResources::Base
  # GET /issues
  # GET /stories.json
  def index
    @issues ||= issues
    @rating = params[:rating]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @issues }
    end
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @issue = Issue.friendly.find(params[:id])
    @pages = @issue.pages.ordered_for_issue

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @issue }
    end
  end

  private

  def issues
    issues = Issue.filter params.slice(:rating)
    issues.ordered.page params[:page]
  end
end
