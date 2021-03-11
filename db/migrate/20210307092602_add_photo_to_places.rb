class AddPhotoToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :photo, :string
  end
end
