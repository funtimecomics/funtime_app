# frozen_string_literal: true

# API controller for pages
class PagesController < InheritedResources::Base
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id])
    respond_to do |format|
      format.json do
        render json: @page.as_json(only: %i[id image], methods: [:image_url])
      end
    end
  end
end
