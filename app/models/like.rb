class Like < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  def update_likes(counter)
    blog.update('likesCounter', counter)
  end
end
