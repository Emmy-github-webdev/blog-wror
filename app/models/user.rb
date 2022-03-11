class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :blogs, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :likes
  validates :name, presence: true
  validates :postsCounter, numericality: { greater_than_or_equal_to: 0 }

  def recent_posts
    blogs.order(created_at: :desc).limit(3)
  end
end
