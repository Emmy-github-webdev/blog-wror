class User < ApplicationRecord
  has_many :comment
  has_many :blog
  has_many :like
end
