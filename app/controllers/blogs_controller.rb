class BlogsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @blogs = @user.recent_posts
  end

  def show
    @user = User.find(params[:user_id])
    @blog = @user.blogs.find(params[:id])
    @comments = @blog.comments.all
  end
end
