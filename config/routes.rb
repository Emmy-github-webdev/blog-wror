Rails.application.routes.draw do
  resources :likes
  resources :comments
  resources :users
  get 'users/:id', to: 'users#show'
  get 'users', to: 'users#index'


  #resources :blogs
  #get 'blogs/:id', to: 'blogs#show'
  #get 'blogs', to: 'blogs#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :users, only: [:index, :show] do
    resources :blogs, only: [:index, :show]
  end
  root 'users#index'
end
