require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:each) { get users_path }  # get(:index)
    it "is a success" do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it "Should has a correct placeholder text" do
      expect(response.body).to include('Users')
    end
    
  end

  describe 'GET #show' do
    before(:each) { get users_path(2) } 
    it "is a success" do
      expect(response).to have_http_status(:ok)
    end
    
    it "Should has a correct placeholder text" do
      expect(response.body).to include('name')
    end
  end
end