class RemoveIntegerFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :integer
    remove_column :messages, :thread
    add_column :messages, :thread_id, :integer
  end
end
