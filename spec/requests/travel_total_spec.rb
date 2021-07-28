require 'rails_helper'

def authenticated_header(user_id = nil)
    user_id = create(:user).id unless user_id
    token = Knock::AuthToken.new(payload: { sub: user_id }).token
    {
        'Authorization': "Bearer #{token}"
    }
end

RSpec.describe 'User travel total', type: :request do
    describe "GET /index with valid endpoint"
        context "get user travel total for single user" do
            it 'returns a successful response' do
                get ("/api/travel_total"), headers: authenticated_header
                json = JSON.parse(response.body)
                expect(response).to have_http_status(:success)
            end
        end

        context "get user travel total for all users" do
            it 'returns a successful response' do
                get ("/api/travel_total_all"), headers: authenticated_header
                json = JSON.parse(response.body)
                expect(response).to have_http_status(:success)
            end
        end
        
end