class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :room_id
      t.string :user_id

      t.timestamps
    end
  end
end
