class CreateCo2Timeframes < ActiveRecord::Migration[6.1]
  def change
    create_table :co2_timeframes do |t|
      t.float :daily
      t.float :weekly
      t.float :monthly

      t.timestamps
    end
  end
end
