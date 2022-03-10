require 'rails_helper'
require './spec/features/user_mock'

RSpec.feature 'user index view', type: :feature do
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

  context 'Elements on page display' do
    it 'can see the username of all other users' do
      users = User.all
      users.each do |user|
        expect(page).to have_content(user.name)
      end
    end
    it 'can see the profile picture for each user' do
      users = User.all.order(:id)
      imgs = page.all('img')
      users.each_with_index do |_user, index|
        expect(imgs[index]['src']).to include('')
      end
      expect(imgs.length).to equal(users.length)
    end
    it 'can see the number of posts each user has written' do
      users = User.all
      users.each do |user|
        expect(page).to have_content "Posts: #{user.postsCounter}"
      end
    end
  end
  context 'User interacton of profile' do
    it "When I click on a user, I am redirected to that user's show page" do
      expect(page).to have_content 'Posts'
      expect(page).to have_content 'All users blog'
    end
  end
end
