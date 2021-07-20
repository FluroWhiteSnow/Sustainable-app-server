class AddUserRefToCupsTotals < ActiveRecord::Migration[6.1]
  def change
    add_reference :cups_totals, :user, null: false, foreign_key: true
  end
end
