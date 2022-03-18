require 'rails_helper'

RSpec.describe 'Categories', type: ['request'] do
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

end
