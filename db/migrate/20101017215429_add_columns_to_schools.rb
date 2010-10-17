class AddColumnsToSchools < ActiveRecord::Migration
  def self.up
    add_column :schools, :student_count, :integer, :default => 0
    add_column :schools, :minority_percentage, :decimal, :precision => 5, :scale => 2
    add_column :schools, :reduced_lunch_percentage, :decimal, :precision => 5, :scale => 2
    
    create_table :ethnicities_schools do |t|
      t.integer :ethnicity_id
      t.integer :school_id
      t.decimal :percentage, :precision => 5, :scale => 2
    end
    
  end

  def self.down
    remove_column :schools, :student_count
    remove_column :schools, :minority_percentage
    remove_column :schools, :reduced_lunch_percentage
    
    drop_table :ethnicities_schools
  end
end
