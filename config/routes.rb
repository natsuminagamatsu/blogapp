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
  root to: "articles#index"
end
