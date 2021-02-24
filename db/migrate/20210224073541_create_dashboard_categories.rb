class CreateDashboardCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :dashboard_categories do |t|
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
