class UserDaily < ApplicationRecord
  belongs_to :user
  belongs_to :cups_total
  belongs_to :travel_total
  has_one :user_co2_daily

  after_create :incriment_cups, :incriment_travel, :calc_travel, :populate_c02_daily

  # Update coffee cups total and reusable cups total

  def incriment_cups
    # access_daily = UserDaily.where(user_id: 1)

    # id = UserDaily.find_by(cups_total_id: access_daily)

    # CupsTotal.where(id: id)

    # ctd = UserDaily.where(user_id: 1).pluck(:coffee_cups)

    # new_sum = CupsTotal.where(id: id).pluck(:coffee_cups_total)

    # CupsTotal.where(id: id).update(coffee_cups_total: new_sum.first + ctd.first)

    total_cups = self.cups_total
    total_cups.update(coffee_cups_total: total_cups.coffee_cups_total + self.coffee_cups)
    total_cups.update(reusable_cups_total: total_cups.reusable_cups_total + self.reusable_cups)
  end

  # Travel Total Update walk/bike total kms, pt total kms and drive total kms
  # (walk_total_km: 0, pt_total_km: 0, drive_total_km: 0)

  # def incriment_travel
  #   total_travel = self.travel_total
  #   total_travel.update(walk_total_km: total_travel.walk_total_km + self.walk)
  #   total_travel.update(pt_total_km: total_travel.pt_total_km + self.pt)
  #   total_travel.update(drive_total_km: total_travel.drive_total_km + self.drive)
  # end


  # Create a new user CO2 Daily per user daily (store variables outside and plug in values into create)
  
  # Create as global variables?
  


  # Calculating the daily c02 for commute route
  def calc_travel

     # c02 per km saved
    walk_calc = 150
    pt_calc = 50
    car_calc = 0

    # Create global variables
    daily_walk_co2 = 0
    daily_pt_co2 = 0
    daily_car_co2 = 0

    user_table = self.user

    if self.public_transport == true
      daily_pt_co2 = user_table.distance_from_work * pt_calc
    else
      daily_pt_c02 = 0
    end
    
    if self.drive == true
      daily_car_co2 = user_table.distance_from_work * car_calc
    else
      daily_car_c02 = 0
    end

    populate_c02_daily(daily_walk_co2, daily_pt_co2, ) 
  end
  
  #Doesnt need to be in method because not boolean
  coffee_calc = 108

  daily_coffee_calc = self.coffee_cups * coffee_calc


  def populate_c02_daily
    
    UserCo2Daily.create(walk_co2: 0, pt_co2: 0, drive_co2: 0, coffee_cups_co2: 0, reusable_cups_co2: 15, user_daily_id: self.id, user_co2_daily_total: 0)
  end
  
  
  cups_c02 = self.user_c02_daily

end
