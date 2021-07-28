require 'rails_helper'

RSpec.describe User, type: :model do

    context 'validation test' do 
        before(:each) do
            @user = build(:user)
          end

        it 'ensures username pressence' do
            user = build(:user, username: nil)
            expect(user).to_not be_valid
        end

        it 'ensures email pressence' do 
            user = build(:user, email: nil)
            expect(user).to_not be_valid
        end

        it 'ensures first name pressence' do 
            user = build(:user, first_name: nil)
            expect(user).to_not be_valid
        end

        it 'ensures last name pressence' do 
            user = build(:user, last_name: nil)
            expect(user).to_not be_valid
        end

        it 'ensures distance from work pressence' do 
            user = build(:user, distance_from_work: nil)
            expect(user).to_not be_valid
        end

        it 'should be valid when all validations are met' do 
            user = build(:user)
            expect(user).to be_valid
        end
    end

    context 'creates totals table for user' do
        it 'should create a user co2 totals table' do
            user = create(:user)
            expect(user.user_co2_total).not_to be_nil
        end

        it 'should create a cups total table' do 
            user = create(:user)
            expect(user.cups_total).not_to be_nil
        end

        it 'should create a travel total table' do 
            user = create(:user)
            expect(user.cups_total).not_to be_nil
        end
    end

end