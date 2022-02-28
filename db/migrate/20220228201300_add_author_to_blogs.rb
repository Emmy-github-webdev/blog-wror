class AddAuthorToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :author, :string
  end
end
