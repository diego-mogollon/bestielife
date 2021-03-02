class AddImageToBudgets < ActiveRecord::Migration[6.0]
  def change
    add_column :budgets, :img, :string
  end
end
