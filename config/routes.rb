Rails.application.routes.draw do
  devise_for :users
  root :to => 'images#index'

  get "profile", to: "users#show"

  resources :images do
    resources :tags
  end
end
