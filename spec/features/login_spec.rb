require 'rails_helper'

RSpec.describe 'Users Log in', type: :feature do
  before :each do
    User.create(name: 'emmanuel', bio: 'Full-Stack Web Developer', postsCounter: 0,
                email: 'emmanuel@gmail.com', password: 'password', confirmed_at: '2022-03-02 17:15:04.123765')
  end
  scenario 'can see the username and password inputs and the Submit button' do
    visit new_user_session_path
    find('#user_email')
    find('#user_password')
    click_button 'Log in'
    expect(page).to be_present
  end

  scenario 'When I click the submit button without filling in the username and the password, I get a detailed error.' do
    visit new_user_session_path
    within('form') do
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'after filling in the username and the password with incorrect data.' do
    visit new_user_session_path
    within('form') do
      fill_in 'user_email', with: 'emmanuel@gmail.com'
      fill_in 'user_password', with: 'incorrect'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  scenario 'When I click the submit button after filling in the username and the password with correct data.' do
    visit new_user_session_path
    within('form') do
      fill_in 'user_email', with: 'emmanuel@gmail.com'
      fill_in 'user_password', with: 'password'
    end
    click_button('Log in')
    expect(page).to have_content('Signed in successfully.')
  end
end
