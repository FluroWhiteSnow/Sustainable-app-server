class CreateUserCo2Dailies < ActiveRecord::Migration[6.1]
  def change
    create_table :user_co2_dailies do |t|
      t.float :walk_co2
      t.float :pt_co2
      t.float :drive_co2
      t.float :coffee_cups_co2
      t.float :reusible_cups_co2
      t.references :user_daily, null: false, foreign_key: true
      t.references :user_co2_total, null: false, foreign_key: true

      t.timestamps
    end
  end
end
