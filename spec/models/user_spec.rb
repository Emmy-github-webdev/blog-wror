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
end