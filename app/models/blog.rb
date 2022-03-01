class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  after_save :update_post

  def recent_comment
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post
    user.update(postsCounter: user.blogs.length)
  end
end
