class BlogsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @blogs = @user.blogs
  end

  def show
    @user = User.find(params[:user_id])
    @blog = @user.blogs.find(params[:id])
    @comments = @blog.comments.all
  end

  def new
    @blog = Blog.new
  end
  
end
