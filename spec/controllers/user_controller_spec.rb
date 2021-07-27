require 'rails_helper'

RSpec.describe "User", type: :request do
  describe "GET /index" do
    it 'returns a successful response' do
      get :index
      expect(response) to be_success
    end
  end

end
