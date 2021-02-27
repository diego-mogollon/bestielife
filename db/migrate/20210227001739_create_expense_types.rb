class CreateExpenseTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :expense_types do |t|
      t.string :name
      t.integer :budget

      t.timestamps
    end
  end
end
