class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.string :name, :null => false

      t.string :address1, :null => false
      t.string :address2, :null => false
      t.string :city, :null => false
      t.string :zip, :null => false, :limit => 10

      t.integer :state_id, :null => false
      t.integer :county_id, :null => false
      t.integer :neighborhood_id
      
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at
      
      t.timestamps
    end    
  end

  def self.down
    drop_table :schools
  end
end
