class UserCo2Daily < ApplicationRecord
  belongs_to :user_daily
  belongs_to :user_co2_total
  
  after_create :increment_total
  before_destroy :delete_co2_total_table

  def increment_total
    total_co2 = self.user_co2_total

    total_co2.update(walk_co2_total: total_co2.walk_co2_total + self.walk_co2)
    total_co2.update(pt_co2_total: total_co2.pt_co2_total + self.pt_co2)
    total_co2.update(drive_co2_total: total_co2.drive_co2_total + self.drive_co2)
    total_co2.update(coffee_cups_co2_total: total_co2.coffee_cups_co2_total + self.coffee_cups_co2)
    total_co2.update(reusable_cups_co2_total: total_co2.reusable_cups_co2_total + self.reusable_cups_co2)
  end

  def delete_co2_total_table
    total_co2 = self.user_co2_total

    total_co2.update(walk_co2_total: total_co2.walk_co2_total - self.walk_co2)
    total_co2.update(pt_co2_total: total_co2.pt_co2_total - self.pt_co2)
    total_co2.update(drive_co2_total: total_co2.drive_co2_total - self.drive_co2)
    total_co2.update(coffee_cups_co2_total: total_co2.coffee_cups_co2_total - self.coffee_cups_co2)
    total_co2.update(reusable_cups_co2_total: total_co2.reusable_cups_co2_total - self.reusable_cups_co2)
  end

end
