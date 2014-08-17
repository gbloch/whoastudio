Rails.application.routes.draw do

  devise_for :admins

  root to: "welcome#index"

  post "set_navigation_state_session", 
    to: "admins#set_navigation_state_session"

  resources :posts, only: [:show]

  namespace :admins do
    root to: "posts#index"

    resources :posts
  end
end
