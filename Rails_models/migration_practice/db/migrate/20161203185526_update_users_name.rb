class UpdateUsersName < ActiveRecord::Migration
#the migration had update_users_name, rails automatically adjusts the class to UpdateUsersName
 def change
  rename_table :contents, :users
#rename_table is the method of change, :contents is the old name, :users is the new name.
 end
end
