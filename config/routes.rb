Rails.application.routes.draw do

  devise_for :admins, controllers: {registrations: "admins/registrations"}

  root to: "posts#index"

  post "set_navigation_state", to: "navigation#set_navigation_state"

  resources :posts, only: [:index, :show]
  resources :works, only: [:index]

  namespace :admins do
    root to: "posts#index"

    resources :posts
  end
end
