class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
