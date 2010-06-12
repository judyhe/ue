class CreateRelations < ActiveRecord::Migration
  def self.up
    create_table :relations do |t|
      t.string :first_name, :null => false, :limit => 100, :default => ''
      t.string :last_name, :null => false, :limit => 100, :default => ''
      t.string :email, :limit => 100
      t.string :home_phone, :limit => 20
      t.string :cell_phone, :limit => 20
      
      t.string :address1
      t.string :address2
      t.string :city, :limit => 100
      t.string :zip, :limit => 10
      t.integer :state_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :relations
  end
end
