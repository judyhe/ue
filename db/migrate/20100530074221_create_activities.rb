class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.string :name
      t.integer :parent_id
    end
  end

  def self.down
    drop_table :activities
  end
end
