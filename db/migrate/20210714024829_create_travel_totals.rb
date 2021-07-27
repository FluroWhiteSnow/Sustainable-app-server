class CreateTravelTotals < ActiveRecord::Migration[6.1]
  def change
    create_table :travel_totals do |t|
      t.float :walk_total_km
      t.float :pt_total_km
      t.float :drive_total_km

      t.timestamps
    end
  end
end
