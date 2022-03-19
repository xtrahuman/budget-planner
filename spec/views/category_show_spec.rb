require 'rails_helper'

RSpec.describe 'Category Show', type: :feature do
  describe 'Category' do
    before(:each) do
      @user1 = User.create! name: 'tochi', password: '123456789', email: 'yt@yahoo.com', confirmed_at: Time.now

      visit new_user_session_path
      fill_in 'Email', with: 'yt@yahoo.com'
      fill_in 'Password', with: '123456789'
      click_button 'Log in'
      @category1 = Category.create!(name: 'test category name', user_id: @user1.id)

      @item1 = @category1.items.create!(name: 'Test items 1', amount: 20, user_id: @user1.id)
      @item2 = @category1.items.create!(name: 'Test items 2', amount: 40, user_id: @user1.id)
      visit root_path
      click_on 'link to items'
    end

    it 'can see the page' do
      expect(page).to have_content('Items Page')
    end

    it 'shows item title' do
      expect(page).to have_content('Test items 1')
      expect(page).to have_content('20')
    end

    it 'shows total item costs' do
      expect(page).to have_content('Items Costs')
      expect(page).to have_content('60')
    end
  end
end
