class UpdatePrograms < ActiveRecord::Migration
  def self.up
    add_column :programs, :gender, :string, :limit => 2
  end

  def self.down
    remove_column :programs, :gender
  end
end
