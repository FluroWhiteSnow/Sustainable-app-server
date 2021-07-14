class CreateUserDailies < ActiveRecord::Migration[6.1]
  def change
    create_table :user_dailies do |t|
      t.boolean :walk
      t.boolean :public_transport
      t.boolean :drive
      t.integer :coffee_cups
      t.integer :reusable_cups
      t.references :user, null: false, foreign_key: true
      t.references :cups_total, null: false, foreign_key: true
      t.references :travel_total, null: false, foreign_key: true

      t.timestamps
    end
  end
end
