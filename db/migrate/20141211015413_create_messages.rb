class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :thread
      t.text :message
      t.string :user_id
      t.string :integer

      t.timestamps
    end
  end
end
