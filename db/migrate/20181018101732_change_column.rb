class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :room_id, :string
    remove_column :posts, :user_id, :string
    remove_column :members, :room_id, :string
    remove_column :members, :user_id, :string
    remove_column :rooms, :user_id, :string

    add_column :posts, :room_id, :integer
    add_column :posts, :user_id, :integer
    add_column :members, :room_id, :integer
    add_column :members, :user_id, :integer
    add_column :rooms, :user_id, :integer
  end
end
