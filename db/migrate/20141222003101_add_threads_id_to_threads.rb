class AddThreadsIdToThreads < ActiveRecord::Migration
  def change
    add_column :threads, :threads_id, :integer
    remove_column :threads, :thread_id, :integer
  end
end
