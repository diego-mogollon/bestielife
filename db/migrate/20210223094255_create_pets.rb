class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :pet_name
      t.string :birthday
      t.string :breed
      t.string :microchip
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
