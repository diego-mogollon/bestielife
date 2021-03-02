class AddImgToExpenseTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :expense_types, :img, :string
  end
end
