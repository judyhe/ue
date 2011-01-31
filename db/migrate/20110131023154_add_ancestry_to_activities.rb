class AddAncestryToActivities < ActiveRecord::Migration
  def self.up
    add_column :activities, :ancestry, :string
    add_index :activities, :ancestry
  end

  def self.down
    remove_column :activities, :ancestry
    remove_index :activities, :ancestry
  end
end
