class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.string :name, :null => false, :default => ""

      t.string :address1
      t.string :address2
      t.string :city, :limit => 100
      t.string :zip, :limit => 10

      t.integer :state_id
      t.integer :county_id
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
