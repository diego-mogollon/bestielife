class AddDateToExpenses < ActiveRecord::Migration[6.0]
  def change
    add_column :expenses, :date, :datetime
  end
end
