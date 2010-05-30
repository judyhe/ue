class CreateEthnicities < ActiveRecord::Migration
  def self.up
    create_table :ethnicities do |t|
      t.string :name, :null => false
      t.integer :ord
    end
  end

  def self.down
    drop_table :ethnicities
  end
end
