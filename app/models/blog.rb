class Blog < ApplicationRecord
  has_many :comment
  belongs_to :user
  has_many :like
end
