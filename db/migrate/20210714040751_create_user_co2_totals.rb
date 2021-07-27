class CreateUserCo2Totals < ActiveRecord::Migration[6.1]
  def change
    create_table :user_co2_totals do |t|
      t.float :walk_co2_total
      t.float :pt_co2_total
      t.float :drive_co2_total
      t.float :coffee_cups_co2_total
      t.float :reusable_cups_co2_total

      t.timestamps
    end
  end
end
