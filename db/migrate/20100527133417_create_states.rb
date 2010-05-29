class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :abbr, :limit => 2, :null => false
      t.string :name, :limit => 40, :null => false
    end
  end

  def self.down
    drop_table :states
  end
end
