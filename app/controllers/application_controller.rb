# frozen_string_literal: true

# Base controller for app
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
