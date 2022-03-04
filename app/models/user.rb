class User < ApplicationRecord
  has_many :blogs
  has_many :comments
  has_many :likes
  validates :name, presence: true
  validates :postsCounter, numericality: { greater_than_or_equal_to: 0 }

  def recent_posts
    blogs.order(created_at: :desc).limit(3)
  end
end
