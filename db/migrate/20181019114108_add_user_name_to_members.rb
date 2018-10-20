class AddUserNameToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :user_name, :string
  end
end
