class CreateGradesSchools < ActiveRecord::Migration
  def self.up
    create_table :grades_schools, :id => false do |t|
      t.integer :grade_id, :null => false
      t.integer :school_id, :null => false
    end
  end

  def self.down
    drop_table :grades_schools
  end
end