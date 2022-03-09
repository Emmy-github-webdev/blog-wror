require 'rails_helper'
require './spec/features/user_mock'

RSpec.describe 'user show view', type: :feature do
  include UserMocks
  before :each do
    @users = create_users
    @blogs = create_blogs(@users)
    visit new_user_session_path
    within('form') do
      fill_in 'user_email', with: 'emmanuel@2.com'
      fill_in 'user_password', with: 'admin123'
    end
    click_button 'Log in'
  end

  context 'Elements on page show' do

    it 'Should display User\'s name' do
      expect(page).to have_content(@users.first.name)
    end

    it 'Should display number of posts by its user' do
      expect(page).to have_content "Posts: #{@users.first.postsCounter}"
    end

    it 'Should display user\'s bio' do
      expect(page).to have_content 'All users blog'
    end

  end

  context 'User interaction of profile' do
    it 'Redirect to full post page' do
      expect(page).to have_content 'Posts'
    end
  end
end