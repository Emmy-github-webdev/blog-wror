Rails.application.routes.draw do
  
  resources :users, only: %i[index show] do
    resources :blogs, only: %i[index show]
  end
  post 'users/:user_id/blog', to: 'blogs#create', as: 'create_new_blog'
  post 'users/:id/comment/create', to: 'comments#create', as: 'comment_form'
  post 'users/:id/like/create', to: 'likes#create', as: 'like_form'
  get 'users/blogs/:blog_id/comments/new', to: 'comments#new', as: 'blog_comment'
  get 'users/:user_id/blogs/new', to: 'blogs#new', as: 'user_new_blog'
  root 'users#index'

end
