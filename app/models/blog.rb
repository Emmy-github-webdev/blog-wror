class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def update_post(counter)
    user.update('postsCounter', counter)
  end

  def recent_comment
    comments.order(created_at: :desc).limit(5)
  end
end
