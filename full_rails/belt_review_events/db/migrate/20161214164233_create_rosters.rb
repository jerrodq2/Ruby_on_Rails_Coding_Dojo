class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
