class RenameColumnUsernameinUserstoName < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :username, :name
  end
end
