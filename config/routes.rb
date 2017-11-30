Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root :to => 'images#index'

  get "profile", to: "users#show"
  get "tags", to: "users#tag"

  resources :images do
    member do
      post :like
    end
    resources :tags
  end
end
