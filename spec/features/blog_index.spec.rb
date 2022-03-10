require 'rails_helper'
require './spec/features/user_mock'

RSpec.describe 'Post index view', type: :feature do
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
    it 'can see the user profile picture' do
      expect(page).to have_css('img')
    end

    it 'can see the user username' do
      expect(page).to have_content(@users.first.name)
    end

    it 'can see the number of posts the user has written' do
      expect(page).to have_content "Posts: #{@users.first.postsCounter}"
    end

    it 'can see a post title' do
      blog = Blog.all.where(user_id: 1)
      blog.each do |t|
        expect(page).to have_content t.title
      end
    end

    it 'can see some of the post body' do
      blog = Blog.all.where(user_id: 1)
      blog.each do |t|
        expect(page).to have_content t.title
      end
    end
  end

  context 'Display comments, likes and pagination' do
    it 'can see the first comments on a post' do
      expect(page).to have_content('Posts')
    end

    it 'can see how many comments a post has' do
      expect(page).to have_content('Posts')
    end

    it 'can see how many likes a post has' do
      expect(page).to have_content('Posts')
    end

    it 'can see a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_content('All users blog')
    end
  end

  context 'User profile' do
    it 'When I click on a post, it redirects me to that post show page' do
      expect(page).to have_content 'Posts'
    end
  end
end