Rails.application.routes.draw do

  root to: "welcome#index"

  resources :posts, only: [:show]

  namespace :admin do
    
    root to: "sessions#new"
    
    get "sign_in", to: "sessions#new"
    
    resources :posts
  end
end
