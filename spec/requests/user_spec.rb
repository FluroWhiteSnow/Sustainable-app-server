require 'rails_helper'

def authenticated_header(user_id = nil)
    user_id = create(:user).id unless user_id
    token = Knock::AuthToken.new(payload: { sub: user_id }).token
    {
        'Authorization': "Bearer #{token}"
    }
end

RSpec.describe 'User request', type: :request do
  context "GET /index" do
    it 'returns a successful response to get a single user' do
      get ("/api/user"), headers: authenticated_header
      json = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
    end
  end

    context "get user for all users" do
      it 'returns a successful response to get all users' do
          get ("/api/user_all"), headers: authenticated_header
          json = JSON.parse(response.body)
          expect(response).to have_http_status(:success)
      end
  end
 

  describe "POST /create" do 
      context "based on valid parameters" do
        before(:each) do
          post("/api/auth/sign_up", params: {"user":{
            "first_name": "Bob222",
            "last_name": "Smith",
            "username": "bob222",
            "password": "test1234",
            "password_confirmation": "test1234",
            "email": "bob222@gmail.com",
            "department_code": "Accounting",
            "distance_from_work": 10,
            "admin": true
          }})
        end

        it "should create a new user" do
          expect(User.last.username).to eql("bob222")
        end

        it "should render a JSON response with the new user" do
          expect(response.content_type).to eql("application/json; charset=utf-8")
        end 
    end

    context "based on invalid parameters" do 
      before(:each) do
        post("/api/auth/sign_up", params: {"user":{
          "first_name": "Bob222",
          "last_name": "Smith",
          "username": "bob222",
          "email": "bob222@gmail.com",
          "department_code": "Accounting",
          "distance_from_work": 10,
          "admin": true
        }})
      end

      it 'should return processabke entity' do 
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

    describe "PATCH /update" do
      context "based on valid parameters" do
        before(:each) do
          @user = create(:user)
          patch("/api/user/#{@user.id}", params: {"user":{
            "first_name": "Joey",
            "last_name": "Super",
            "username": "joey123",
            "password": "test1234",
            "password_confirmation": "test1234",
            "email": "joey1234@gmail.com",
            "department_code": "Accounting",
            "distance_from_work": 10,
            "admin": true
          }}, headers: authenticated_header(@user.id))
        end
        it "should update the user first name" do
          expect(User.find(@user.id).first_name).to eql("Joey")
        end

        it "should update the user last name" do
          expect(User.find(@user.id).last_name).to eql("Super")
        end

        it "should renders a JSON response with the user profile" do
          expect(response.content_type).to eql("application/json; charset=utf-8")
        end

      end

    end

  end

