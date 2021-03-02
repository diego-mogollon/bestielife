class AddBudgetToExpenseTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :expense_types, :budget, :integer
  end
end
