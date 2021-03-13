class RemoveImgFromBudgets < ActiveRecord::Migration[6.0]
  def change
    remove_column :budgets, :img, :string
  end
end
