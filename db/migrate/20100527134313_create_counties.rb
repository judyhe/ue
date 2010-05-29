class CreateCounties < ActiveRecord::Migration
  def self.up
    create_table :counties do |t|
      t.string :name, :limit => 100, :null => false
      t.integer :state_id, :null => false
    end
  end

  def self.down
    drop_table :counties
  end
end
