# Front-end controller for 404, 500 etc. errors
class ErrorsController < ApplicationController
  def show
    render status_code.to_s, status: status_code
  end

  protected

  def status_code
    params[:code] || 500
  end
end
