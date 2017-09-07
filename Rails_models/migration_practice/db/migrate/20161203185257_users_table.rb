class UsersTable < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :user_name
      t.string :last_name
      t.timestamps
    end
  end
end
