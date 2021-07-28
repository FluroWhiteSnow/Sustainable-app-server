FactoryBot.define do
    factory :user do
        first_name { "Test1" }
        last_name { "Test" }
        username { "Test1" }
        password { "test123" }
        password_confirmation { "test123" }
        email { "test1@gmail.com" }
        department_code { "Accounting" }
        admin { true }
        distance_from_work { 10 }
    end
  end
