class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :reciever
      t.references :sender

      t.timestamps
    end
  end
end
