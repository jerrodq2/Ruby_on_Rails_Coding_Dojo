class DeleteAuthorFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :author
  end
end
