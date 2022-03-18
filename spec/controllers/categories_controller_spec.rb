
require 'rails_helper'

RSpec.describe 'Categories', :type => ['request'] do

  describe 'GET #index' do
    before(:example) { get '/categories' }
    it 'check categories status' do
      expect(response).to have_http_status(:ok)
    end
    it 'render a template' do
      expect(response).to render_template('categories/index')
    end
    it 'renders body placeholder' do
      expect(response.body).to include('Budget Planner')
    end
  end
# describe 'GET /show' do
# before(:each) do
#     User.create! name: 'tochi', password: '123456789', email: 'yt@yahoo.com', confirmed_at: Time.now
#     visit new_user_session_path
#     fill_in 'Email', with: 'yt@yahoo.com'
#     fill_in 'Password', with: '123456789'
#     click_button 'Log in'
# end
#     # before(:each) {get '/categories/:category_id'}

#     it 'http status to be ok' do
#      get '/categories/:id'
#       expect(response).to have_http_status(:ok)
#     end

#     it 'render a all item template' do
#       expect(response).to render_template('categories/show')
#     end

#     it 'show correct place holder' do
#       expect(response.body).to include('Items Page')
#     end
#   end
end