require 'rails_helper'

RSpec.describe Comment, type: :model do
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

  it 'add to a blog' do
    blog.comments.create!(user:, text: 'Unit testing is interesting. Though complicated!')
    expect(blog.comments.count).to eq(1)
  end
end
