class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  after_save :update_comments

  private

  def update_comments
    blog.update(commentsCounter: blog.comments.length)
  end
end
