require 'rails_helper'

def authenticated_header(user_id = nil)
    user_id = create(:user).id unless user_id
    token = Knock::AuthToken.new(payload: { sub: user_id }).token
    {
        'Authorization': "Bearer #{token}"
    }
end

RSpec.describe UserDaily, type: :model do

    context 'validation test' do 
        before(:each) do
            @user = create(:user)
            @user_daily = create(:user_daily, user_id: @user.id)
        end

        it 'should be valid when all are met' do 
            expect(@user_daily).to be_valid
        end
    end

end

