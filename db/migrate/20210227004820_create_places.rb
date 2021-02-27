class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :description
      t.string :phone
      t.string :website
      t.integer :rating

      t.timestamps
    end
  end
end
