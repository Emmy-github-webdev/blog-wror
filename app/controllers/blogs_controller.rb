class BlogsController < ApplicationController

  def index
    @blog_items = Blog.all
  end

  
end
