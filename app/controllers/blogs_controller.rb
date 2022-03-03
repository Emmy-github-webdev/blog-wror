class BlogsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @blogs = @user.blogs
  end

  def show
    @user = User.find(params[:id])
    @blog = @user.blogs.find(params[:user_id])
    @comments = @blog.comments.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @current_user = User.find(params[:user_id])
    @blog = Blog.new(user: @current_user,
                     title: params[:blog][:title],
                     text: params[:blog][:text])
    if @blog.save
      flash[:notice] = 'Blog added'
      redirect_to user_blogs_path(blog.user.id)
    else
      render :new
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :text)
  end
end
