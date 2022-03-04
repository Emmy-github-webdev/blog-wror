require 'rails_helper'

RSpec.describe Blog, type: :model do
  subject do
    Blog.new(
      user_id: 1,
      title: 'Unit testing',
      text: 'Unit testing is interesting. Though complicated!',
      commentsCounter: 3,
      likesCounter: 2
    )
  end
  before { subject.save }

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "title maximum length is 250" do
    subject.title = 'hello' * 260
    expect(subject).to_not be_valid
  end

  it "likes counter must be an integer greater or equal to 0" do
    subject.likesCounter = nil
    expect(subject).to_not be_valid
  end
  
  
end