require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) do
    User.create!(
      name: 'John',
      photo: 'https://www.photo.com',
      bio: 'A Teacher',
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

  it 'update likes for a blog' do
    blog.likes.create!(user:)
    expect(blog.likes.count).to eq(1)
  end
end
