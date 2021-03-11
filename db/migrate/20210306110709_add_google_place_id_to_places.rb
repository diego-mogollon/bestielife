class AddGooglePlaceIdToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :google_place_id, :string
  end
end
