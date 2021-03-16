class AddImgToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_column :chatrooms, :img, :string
  end
end
