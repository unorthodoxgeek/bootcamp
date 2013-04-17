class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :role
      t.timestamps
    end
    add_index :roles, [:project_id, :user_id]
  end
end
