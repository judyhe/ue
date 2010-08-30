class CreateAges < ActiveRecord::Migration
  def self.up
    create_table :ages do |t|
      t.integer :age  
    end
  end

  def self.down
    drop_table :ages
  end
end
