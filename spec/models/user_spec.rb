require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'John',
      photo: 'https://www.photo.com',
      bio: 'A Teacher',
      postsCounter: 2
    )
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'blog counter should be provided' do
    subject.postsCounter = nil
    expect(subject).to_not be_valid
  end

  it 'name is required' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'return 3 blogs' do
    subject.blogs.create(title: 'testing title', text: 'testing text', commentsCounter: 1, likesCounter: 0)
    subject.blogs.create(title: 'testing title 1', text: 'testing text 1', commentsCounter: 1, likesCounter: 0)
    subject.blogs.create(title: 'testing title 2', text: 'testing text 2', commentsCounter: 1, likesCounter: 0)
    subject.blogs.create(title: 'testing title 3', text: 'testing text 3', commentsCounter: 1, likesCounter: 0)
    expect(subject.recent_posts.length).to eq(3)
  end
end
