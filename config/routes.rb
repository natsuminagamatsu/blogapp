Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end

  resources :comments
  resources :users
  resources :auth
  root to: "articles#index"
end
