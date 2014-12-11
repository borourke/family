class AddFirstMessageToThreads < ActiveRecord::Migration
  def change
    add_column :threads, :first_message, :text
  end
end
