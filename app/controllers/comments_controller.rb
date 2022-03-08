class CommentsController < ApplicationController
  load_and_authorize_resource

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
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to user_blogs_path(@blog.user.id), notice: 'Comment item was successfully removed.' }
    end
  end

  private

  def comment_params
    params.require(:data).permit(:text)
  end
end
