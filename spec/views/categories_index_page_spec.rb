require 'rails_helper'

RSpec.describe 'Category Index', type: :feature do
  describe 'Category' do
    before(:example) do
      @user1 = User.create! name: 'tochi', password: '123456789', email: 'yt@yahoo.com',
                            confirmed_at: Time.now
      visit new_user_session_path
      fill_in 'Email', with: 'yt@yahoo.com'
      fill_in 'Password', with: '123456789'
      click_button 'Log in'
      visit root_path
    end

    it 'shows the username of the user' do
      expect(page).to have_content('tochi')
    end

    it 'shows number of amount of budget for each user' do
      expect(page).to have_content('Total Budget')
      expect(page).to have_content('0')
    end

    it 'show create new category page' do
      click_on 'Create Category'
      expect(page).to have_current_path new_category_path
    end
  end
end
