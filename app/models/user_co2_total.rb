class UserCo2Total < ApplicationRecord
  has_many :user_co2_dailies
  belongs_to :user

end
