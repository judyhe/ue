class CreateNeighborhoods < ActiveRecord::Migration
  def self.up
    create_table :neighborhoods do |t|
      t.string :name, :limit => 60, :null => false
      t.integer :county_id, :null => false
      t.integer :ord, :null => false
    end
  end

  def self.down
    drop_table :neighborhoods
  end
end
