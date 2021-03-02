class AddMonthToBudgets < ActiveRecord::Migration[6.0]
  def change
    add_column :budgets, :month, :string
  end
end
