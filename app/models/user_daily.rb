class UserDaily < ApplicationRecord
  belongs_to :user
  belongs_to :cups_total
  belongs_to :travel_total
  has_one :user_co2_daily
end
