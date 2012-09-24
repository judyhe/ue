class AddRemovedAtToOrgsAndPeople < ActiveRecord::Migration
  def self.up
    add_column :organizations, :removed_at, :datetime
    add_column :people, :removed_at, :datetime
  end

  def self.down
    remove_column :organizations, :removed_at
    remove_column :people, :removed_at, :datetime
  end
end
