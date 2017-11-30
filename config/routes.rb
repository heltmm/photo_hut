Rails.application.routes.draw do
  devise_for :users
  root :to => 'images#index'

  resources :images do
    resources :tags
  end
end
