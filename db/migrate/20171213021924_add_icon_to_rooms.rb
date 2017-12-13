class AddIconToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :icon, :string
  end
end
