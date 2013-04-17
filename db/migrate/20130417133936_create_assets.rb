class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :file
      t.string :type
      t.references :owner, polymorphic: true
      t.timestamps
    end
    add_index :assets, [:owner_type, :owner_id]
  end
end
