class UserDaily < ApplicationRecord
  belongs_to :user
  belongs_to :cups_total
  belongs_to :travel_total
  has_one :user_co2_daily

  before_validation :set_totals
  after_create :increment_cups, :increment_travel, :calc_co2

  # before_update :previous_cups
  # after_update :update_total_table

  # def previous_cups
  #   @coffee_cups = self.coffee_cups
  #   @reusable_cups = self.reusable_cups
  # end

  # def update_total_table
  #   coffee_cups_difference = self.coffee_cups - @coffee_cups
  #   reusable_cups_difference = self.reusable_cups - @reusable_cups
  #   total_cups = self.cups_total
  #   total_cups.update(coffee_cups_total: total_cups.coffee_cups_total + coffee_cups_difference,  reusable_cups_total: total_cups.reusable_cups_total + reusable_cups_difference)
  # end

  def set_totals
    return unless self.new_record?
    self.cups_total_id = self.user.cups_total.id
    self.travel_total_id = self.user.travel_total.id
  end

  def increment_cups
    total_cups = self.cups_total
    id = self.user_id 
    total_cups.update(user_id: id, coffee_cups_total: total_cups.coffee_cups_total + self.coffee_cups)
    total_cups.update(user_id: id, reusable_cups_total: total_cups.reusable_cups_total + self.reusable_cups)
  end

  def increment_travel
    total_travel = self.travel_total
    user_table = self.user

    if self.walk == true 
      total_travel.update(walk_total_km: total_travel.walk_total_km + user_table.distance_from_work)
    elsif self.public_transport == true 
      total_travel.update(pt_total_km: total_travel.pt_total_km + user_table.distance_from_work)
    elsif self.drive == true
      total_travel.update(drive_total_km: total_travel.drive_total_km + user_table.distance_from_work)
    end

  end

  def calc_co2

    walk_calc = 150
    pt_calc = 50
    car_calc = 0
    reusable_cup_calc = 20

    daily_walk_co2 = 0
    daily_pt_co2 = 0
    daily_car_co2 = 0
    daily_coffee_co2 = 0
    daily_reusable_cup_co2 = 0
    daily_co2_total = daily_walk_co2 + daily_pt_co2 + daily_car_co2 + daily_reusable_cup_co2

    user_table = self.user

    if self.walk == true 
      daily_walk_co2 = user_table.distance_from_work * walk_calc
    else
      daily_walk_c02 = 0
    end

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

    daily_reusable_cup_co2 = self.reusable_cups * reusable_cup_calc
    daily_coffee_co2 = self.coffee_cups * reusable_cup_calc

    populate_c02_daily(daily_walk_co2, daily_pt_co2, daily_car_co2, daily_coffee_co2, daily_reusable_cup_co2, daily_co2_total, user_table.user_co2_total.id) 

  end

  def populate_c02_daily(walkCo2, ptCo2, driveCo2, coffeeCo2, cupCo2, totalCo2, totalId)
    UserCo2Daily.create(user_co2_total_id: totalId, walk_co2: walkCo2, pt_co2: ptCo2, drive_co2: driveCo2, coffee_cups_co2: coffeeCo2, reusable_cups_co2: cupCo2, user_daily_id: self.id, user_co2_daily_total: totalCo2)
  end

end
