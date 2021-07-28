require 'rails_helper'

def authenticated_header(user_id = nil)
    user_id = create(:user).id unless user_id
    token = Knock::AuthToken.new(payload: { sub: user_id }).token
    {
        'Authorization': "Bearer #{token}"
    }
end

RSpec.describe 'User co2 daily', type: :request do
    describe "GET /index with valid endpoint"
        context "get user co2 total for single user" do
            it 'returns a successful response' do
                get ("/api/user_co2_daily"), headers: authenticated_header
                json = JSON.parse(response.body)
                expect(response).to have_http_status(:success)
            end
        end

        context "get user co2 daily for all users" do
            it 'returns a successful response' do
                get ("/api/user_co2_daily_all"), headers: authenticated_header
                json = JSON.parse(response.body)
                expect(response).to have_http_status(:success)
            end
        end
        
end