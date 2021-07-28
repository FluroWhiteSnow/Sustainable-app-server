FactoryBot.define do
    factory :user_daily do
        walk {true}
        public_transport {false}
        drive {false}
        coffee_cups {12}
        reusable_cups {6}
    end
  end
