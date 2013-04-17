class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :status
      t.integer :assignee_id
      t.integer :project_id
      t.timestamps
    end
    add_index :tasks, :project_id
    add_index :tasks, :assignee_id
  end
end
