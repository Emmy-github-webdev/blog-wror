class AddCommentCounterToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :commentsCounter, :integer
    add_column :blogs, :likesCounter, :integer
  end
end
