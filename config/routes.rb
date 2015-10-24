Rails.application.routes.draw do

  devise_for :admins, controllers: {registrations: "admins/registrations"}

  root to: "posts#index"

  resources :posts, only: [:index, :show]
  resources :works, only: [:index]

  namespace :admins do
    root to: "posts#index"

    resources :posts
  end
end
