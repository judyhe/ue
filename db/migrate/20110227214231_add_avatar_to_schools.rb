class AddAvatarToSchools < ActiveRecord::Migration
  def self.up
    add_column :schools, :avatar, :string
  end

  def self.down
    remove_column :schools, :avatar
  end
end
