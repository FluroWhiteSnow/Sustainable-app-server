class UserCo2Total < ApplicationRecord
  belongs_to :co2_timeframes
  has_many :user_co2_dailies
end
