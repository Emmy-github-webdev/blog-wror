class Like < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  after_save :update_likes

  private

  def update_likes
    blog.update(likesCounter: blog.likes.length)
  end
end
