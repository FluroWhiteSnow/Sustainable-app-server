class CreateCupsTotals < ActiveRecord::Migration[6.1]
  def change
    create_table :cups_totals do |t|
      t.integer :coffee_cups_total
      t.integer :reusible_cups_total

      t.timestamps
    end
  end
end
