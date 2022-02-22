class BlogsController < ApplicationController
  def index
    @blog_items = Blog.all
  end
  def show
    @blog_items = Blog.find(params[:id])
  end
end
