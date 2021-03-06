Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations'
  }
  
  root to: "home#top"
  resources :home do
    collection do 
      get 'home'
      get 'about'
    end
  end
  
  
  resources :rooms, only: [:show]

  resources :words do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    collection do 
      get 'tag_index'
      get 'search'
    end
  end
  
  get "users/:id/like" => "users#like"
  resources :users do
    collection do 
      get 'user_search'
    end
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
