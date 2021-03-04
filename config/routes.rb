Rails.application.routes.draw do
  # get 'search/search'
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resource :relationships, only: [:create, :destroy]

  resources :users do
  get :followings, on: :member
  get :followers, on: :member
  end
  
  get '/search' => 'search#search'

end
# resources :relationships, only: [:create, :destroy]
