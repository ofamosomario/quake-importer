# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root 'welcome#index'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :importers, only: :create
    end
  end
end
