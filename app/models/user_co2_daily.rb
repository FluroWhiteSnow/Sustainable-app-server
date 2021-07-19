class UserCo2Daily < ApplicationRecord
  belongs_to :user_daily
  belongs_to :user_co2_total
  
  

  # Create a co2 total, update per user adding more 
  # walk_co2_total: 0, pt_co2_total: 0, drive_co2_total: 0, coffee_cups_co2_total: 0, reusable_cups_co2_total: 0

  

end
