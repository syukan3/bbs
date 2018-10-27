class ChangeCheckToWelcome < ActiveRecord::Migration[5.2]
  def change
    add_column :welcomes, :guest, :boolean, default: false
    remove_column :welcomes, :check
  end
end
