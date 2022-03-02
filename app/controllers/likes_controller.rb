class LikesController < ApplicationController
  def create
    blog = Blog.find(params[:id])
    like = Like.create(user_id: current_user.id, blog_id: blog.id)
    if like.save
      redirect_to user_blogs_path(blog.user.id, blog.id)
    else
      redirect_to user_blogs_path(blog.user.id, blog.id),
      alert: ''
    end
  end
  
end
