class RemoveParentIdFromActivities < ActiveRecord::Migration
  def self.up
    remove_column :activities, :parent_id
  end

  def self.down
    add_column :activities, :parent_id, :integer
  end
end
