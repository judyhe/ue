class CreateActivitiesStudents < ActiveRecord::Migration
  def self.up
    create_table :activities_students, :id => false do |t|
      t.integer :activity_id, :null => false
      t.integer :student_id, :null => false
    end
  end

  def self.down
    drop_table :activities_students
  end
end
