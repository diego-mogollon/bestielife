class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.integer :amount
      t.references :pet, null: false, foreign_key: true
      t.references :expense_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
