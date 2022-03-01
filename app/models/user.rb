class User < ApplicationRecord
  has_many :blogs
  has_many :comments
  has_many :likes
end
