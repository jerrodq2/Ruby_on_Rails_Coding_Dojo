class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :product
      t.references :user, index: true
      t.date :date
      t.integer :amount
      t.string :status, :null => false, :default => 'For sale'

      t.timestamps
    end
  end
end
