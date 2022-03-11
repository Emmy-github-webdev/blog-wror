require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) do
    User.create!(
      name: 'John',
      photo: 'https://www.photo.com',
      bio: 'A Teacher',
      email: 'emmanuel@2.com',
      password: 'password',
      postsCounter: 2
    )
  end

  let(:blog) do
    Blog.create!(
      user:,
      title: 'Unit testing',
      text: 'Unit testing is interesting. Though complicated!',
      commentsCounter: 0,
      likesCounter: 0
    )
  end
end
