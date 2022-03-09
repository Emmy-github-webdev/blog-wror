class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    blog = Blog.find(params[:id])
    comment = Comment.create(user_id: current_user.id, blog_id: blog.id, text: comment_params[:text])
    if comment.save
      flash[:notice] = 'Comment added'
    else
      flash[:alert] = 'Failed to add comment! Try again'
    end
    redirect_to user_blogs_path(blog.user.id, blog.id)
  end

  def destroy
    @blog = Blog.find_by_id(params[:blog_id])
    @user = User.find_by_id(params[:user_id])
    @comment = @blog.Comments.find(params[:comment_id])
    if @comment.destroy
      flash[:success] = 'Comment item was successfully removed.'
    else
      flash[:error] = 'Try again.'
    end
    redirect_to "/users/#{@user.id}/blogs"
  end

  private

  def comment_params
    params.require(:data).permit(:text)
  end
end
