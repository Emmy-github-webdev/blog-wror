class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  def list_posts
    render json: Blog.all
  end

  def list_comments
    render json: Comment.where(blog_id: params[:blog_id])
  end

  def add_comment
    data = JSON.parse(request.raw_blog)
    @comment = Comment.create(
      blog_id: data['blog_id'],
      user_id: data['user_id'],
      text: data['text']
    )

    if @comment.save
      render json: 'Comment added'
    else
      render json: 'Cannot add comment! Try again'
    end
  end
  
  
end
