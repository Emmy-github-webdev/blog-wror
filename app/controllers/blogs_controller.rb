class BlogsController < ApplicationController
  def index
    @blog_item = Blog.all
  end
  
end
