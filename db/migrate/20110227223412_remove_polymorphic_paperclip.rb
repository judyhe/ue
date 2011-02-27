class RemovePolymorphicPaperclip < ActiveRecord::Migration
  def self.up
    drop_table :attachings
    
    rename_column :assets, :data_file_name, :data
    rename_column :assets, :data_updated_at, :updated_at
    
    add_column :assets, :attachable_id, :integer
    add_column :assets, :attachable_type, :string
    
    remove_column :assets, :data_content_type
    remove_column :assets, :data_file_size
    remove_column :assets, :attachings_count
    
    add_index :assets, :attachable_id  
  end

  def self.down
    create_table "attachings" do |t|
      t.integer  "attachable_id"
      t.integer  "asset_id"
      t.string   "attachable_type"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
    rename_column :assets, :data, :data_file_name
    rename_column :assets, :updated_at, :data_updated_at
    
    remove_column :assets, :attachable_id
    remove_column :assets, :attachable_type
    
    add_column :assets, :data_content_type, :string
    add_column :assets, :data_file_size, :integer
    add_column :assets, :attachings_count, :integer, :default => 0
    
    remove_index :assets, :attachable_id
  end
end

