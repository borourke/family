class CreateThreads < ActiveRecord::Migration
  def change
    create_table :threads do |t|
      t.string :title
      t.text :users

      t.timestamps
    end
  end
end
