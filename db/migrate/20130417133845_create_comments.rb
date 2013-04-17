class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :task_id
      t.text :comment
      t.timestamps
    end
    add_index :comments, :task_id
  end
end
