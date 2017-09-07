class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.date :date
      t.references :seller
      t.references :buyer
      t.references :shoe, index: true

      t.timestamps
    end
  end
end
