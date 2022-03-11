require 'rails_helper'
require './spec/features/user_mock'

RSpec.describe 'Post show view', type: :feature do
  include UserMocks
  before :each do
    @users = create_users
    @blogs = create_blogs(@users)
    @likes, @comments = create_likes_comments(@users, @blogs)
    visit new_user_session_path
    within('form') do
      fill_in 'user_email', with: 'emmanuel@2.com'
      fill_in 'user_password', with: 'admin123'
    end
    click_button 'Log in'
  end

  context 'Post show page' do
    it ' can see the post\'s title' do
      expect(page).to have_content(@users.first.name)
    end

    it 'Should display Post\'s title' do
      expect(page).to have_content('Posts')
    end

    it 'Should display Post\'s title' do
      expect(page).to have_content('Posts')
    end

    it 'can see how many comments it has' do
      expect(page).to have_content('Posts')
    end

    it 'can see how many likes it has' do
      expect(page).to have_content('Posts')
    end

    it 'I can see the username of each commentor' do
      expect(page).to have_content('Posts')
    end
  end
end
