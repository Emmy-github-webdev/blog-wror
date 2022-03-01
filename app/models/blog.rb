class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def update_post(counter)
    user.update('postsCounter', counter)
  end
  
  
  
end
