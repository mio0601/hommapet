Rails.application.routes.draw do
  devise_for :users

  get 'tweets/dog' => 'tweets#dog'
  get 'tweets/cat' => 'tweets#cat'
  get 'tweets/rabbit' => 'tweets#rabbit'
  get 'tweets/bird' => 'tweets#bird'
  get 'tweets/hamster' => 'tweets#hamster'
  get 'tweets/others' => 'tweets#others'

  
  get 'rooms/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  
  resources :rooms

 

  resources :messages, :only => [:create] do
    resources :rooms, :only => [:create, :show]
  end
    root 'tweets#index'

  resources :users do
    member do
     get :following, :followers
    end
  end

   resources :relationships, only: [:create, :destroy]


end
