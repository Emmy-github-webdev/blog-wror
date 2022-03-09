Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show] do
    resources :blogs, only: %i[index show]
  end
  post 'users/:user_id/blog', to: 'blogs#create', as: 'create_new_blog'
  post 'users/:id/comment/create', to: 'comments#create', as: 'comment_form'
  post 'users/:id/like/create', to: 'likes#create', as: 'like_form'
  get 'users/blogs/:blog_id/comments/new', to: 'comments#new', as: 'blog_comment'
  get 'users/:user_id/blogs/new', to: 'blogs#new', as: 'user_new_blog'

  get '/users/:user_id/blogs/:blog_id/destroy_comment', to: 'comments#destroy', as: 'destroy_comment'
  post '/users/:user_id/blogs/:blog_id/destroy_comment', to: 'comments#destroy'

  get '/users/:user_id/blogs/:blog_id/destroy_blog', to: 'blogs#destroy', as: 'destroy_blog'
  post '/users/:user_id/blogs/:blog_id/destroy_blog', to: 'blogs#destroy'





  #delete 'users/:user_id/blogs/:blog_id/comments/:comment_id', to: 'comments#destroy', as: 'user_comment_delete'
  #delete 'users/:user_id/blogs/:blog_id', to: 'blogs#destroy', as: 'user_post_delete'
  root 'users#index'
end
