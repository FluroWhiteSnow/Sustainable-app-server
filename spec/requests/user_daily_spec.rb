require 'rails_helper'

def authenticated_header(user_id = nil)
    user_id = create(:user).id unless user_id
    token = Knock::AuthToken.new(payload: { sub: user_id }).token
    {
        'Authorization': "Bearer #{token}"
    }
end

RSpec.describe 'User Daily request', type: :request do
    describe "GET /index"
        context "get user daily for single user" do
            it 'returns a successful response' do
                get ("/api/user_daily"), headers: authenticated_header
                json = JSON.parse(response.body)
                expect(response).to have_http_status(:success)
            end
        end

        context "get user daily for all users" do
            it 'returns a successful response' do
                get ("/api/user_daily_all"), headers: authenticated_header
                json = JSON.parse(response.body)
                expect(response).to have_http_status(:success)
            end
        end
 
        describe "POST /create" do 
            context "based on valid parameters" do

              before(:each) do
                @user = create(:user)
                post("/api/user_daily", params: {"user_daily":{    
                    walk: true,
                    public_transport: false,
                    drive: false,
                    coffee_cups: 12,
                    reusable_cups: 6}}, headers: authenticated_header(@user.id))
              end
      
              it "should create a new user daily" do
                expect(UserDaily.last.walk).to eql(true)
              end
      
              it "should render a JSON response with the new user daily" do
                expect(response.content_type).to eql("application/json; charset=utf-8")
              end 
          end
        end

    describe "PATCH /update" do
        context "based on valid parameters" do

            before(:each) do
            @user = create(:user)
            @user_daily = create(:user_daily, user_id: @user.id)
            patch("/api/user_daily/#{@user_daily.id}", params: {"user_daily":{    
                "walk": false,
                "public_transport": false,
                "drive": true,
                "coffee_cups": 3,
                "reusable_cups": 3}}, headers: authenticated_header(@user.id))
            end

            it "should update the transportation type in user daily" do
            expect(UserDaily.find(@user_daily.id).walk).to eql(false)
            end

            it "should update the number of coffee cups in user daily" do
            expect(UserDaily.find(@user_daily.id).reusable_cups).to eql(3)
            end

            it "should renders a JSON response with the user edited daily" do
            expect(response.content_type).to eql("application/json; charset=utf-8")
            end
        end
    end

end


