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

  #before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end


  
  
end