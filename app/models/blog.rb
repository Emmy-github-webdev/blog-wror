class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :likes
  after_save :update_post
  validates :title, presence: true, length: { maximum: 250 }
  #validates :commentsCounter, numericality: { greater_than_or_equal_to: 0 }
  #validates :likesCounter, numericality: { greater_than_or_equal_to: 0 }

  def recent_comment
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_post
    user.update(postsCounter: user.blogs.length)
  end
end
