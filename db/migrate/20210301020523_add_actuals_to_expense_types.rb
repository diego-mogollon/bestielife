class AddActualsToExpenseTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :expense_types, :actuals, :integer
  end
end
