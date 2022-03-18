require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  describe 'login' do
    before(:each) do
      User.create! name: 'tochi', password: '123456789', email: 'ft@gmail.com',
                   confirmed_at: Time.now
      visit new_user_session_path
    end
    it 'shows the right content' do
      expect(page).to have_content('Log in')
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
    end

    it 'Fill email and password inputs with incorrect data' do
      fill_in 'Email', with: 'test@yahoo.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'Without fill email and password inputs' do
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'Fill email and password inputs' do
      fill_in 'Email', with: 'ft@gmail.com'
      fill_in 'Password', with: '123456789'
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_current_path root_path
    end
  end
end