Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end

  resources :articles do
    resources :favorites
  end

  resources :comments
  resources :users
  resources :auth
  resources :favorites

  namespace :api do
    resources :articles
  end

  root to: "articles#index"
end
