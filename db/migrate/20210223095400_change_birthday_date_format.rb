class ChangeBirthdayDateFormat < ActiveRecord::Migration[6.0]
  def change
      change_column :pets, :birthday, 'date USING CAST(birthday AS date)'
  end
end