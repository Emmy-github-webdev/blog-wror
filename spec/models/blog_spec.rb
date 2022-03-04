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
end