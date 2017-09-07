class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.references :user, index: true
      t.string :city
      t.references :state, index: true

      t.timestamps
    end
  end
end
