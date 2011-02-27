class AddAvatarToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :avatar, :string
  end

  def self.down
    remove_column :people, :avatar
  end
end
