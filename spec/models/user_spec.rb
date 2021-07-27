require 'rails_helper'

RSpec.describe User, type: :model do

    context 'validation test' do 
        it 'ensures username pressence' do
            user = User.new(first_name: "Bob", last_name: "Smith").save
            expect(user).to eq(false)
        end

        it 'ensures email pressance' do 
            user = User.new(username: "Bob1", password: "test123", password_confirmation: "test123", department_code: "Finance", admin: true, distance_from_work: 5).save
            expect(user). to eq(false)
        end

        it 'should save sucessfully' do 
            user = User.new(first_name: "Harrold", last_name: "Sanders", username: "Harrold1", password: "test123", password_confirmation: "test123", email: "harrold@gmail.com", department_code: "Accounting", admin: true, distance_from_work: 20).save
            expect(user). to eq(true)
        end
    end

end