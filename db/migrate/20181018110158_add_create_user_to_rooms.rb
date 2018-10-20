class AddCreateUserToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :create_user_id, :integer
  end
end
