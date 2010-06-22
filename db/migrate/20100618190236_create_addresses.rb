class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :city, :limit => 100
      t.string :zip, :limit => 10

      t.integer :state_id
      t.integer :county_id
      t.integer :neighborhood_id
      
      t.references :addressable, :polymorphic => true
    end
  end

  def self.down
    drop_table :addresses
  end
end
