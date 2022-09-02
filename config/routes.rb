Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end
  get 'search', to: 'search#index' 
  resources :post do
    member do
      patch "upvote", to: "post#upvote"
      patch "downvote", to: "post#downvote"
    end
    resources :comments
  end
  resources :likes, only: [:create, :destroy, :index]
  resources :profile
  devise_for :views
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  } 
  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end 
  get 'user/:id', to: 'users#show', as: 'user' 
  get 'homepage/index'
  get 'homepage/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "homepage#index"
end
