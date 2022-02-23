require 'rails_helper'

RSpec.describe 'Blogs', type: :request do
  describe 'GET #index' do
    before(:each) { get blogs_path }  # get(:index)
    it "is a success" do
      expect(response).to have_http_status(:ok)
    end
  end
end