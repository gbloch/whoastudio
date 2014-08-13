Rails.application.routes.draw do

  devise_for :admins
  root to: "welcome#index"

  resources :posts, only: [:show]

  namespace :admins do
    root to: "posts#index"

    resources :posts
  end
end
