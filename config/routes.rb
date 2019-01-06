# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :issues

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :people
  resources :stories, only: %i[index show]
  resources :pages, only: [:show]

  root to: 'site#index'

  ActiveAdmin.routes(self)

  %w[404 422 500].each do |code|
    get code, to: 'errors#show', code: code
  end

  # If all else fails, check for static pages
  get ':action' => 'static#:action'
end
