class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.references :user, index: true
      t.references :associate

      t.timestamps
    end
  end
end
