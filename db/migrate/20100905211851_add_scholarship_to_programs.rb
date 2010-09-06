class AddScholarshipToPrograms < ActiveRecord::Migration
  def self.up
    add_column :programs, :scholarship, :boolean, :default => false 
  end

  def self.down
    remove_column :programs, :scholarship
  end
end
