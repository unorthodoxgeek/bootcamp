class CreateChangeLogs < ActiveRecord::Migration
  def change
    create_table :change_logs do |t|
      t.integer :task_id
      t.text :changes
      t.timestamps
    end
    add_index :change_logs, :task_id
  end
end
