class AddLikeReferenceToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_reference :blogs, :like, null: true, foreign_key: true
  end
end
