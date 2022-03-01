class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  def update_comments(counter)
    blog.update('commentsCounter', counter)
  end
end
