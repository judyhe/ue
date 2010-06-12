class CreateRelatedStudents < ActiveRecord::Migration
  def self.up
    create_table :related_students, :force => true, :id => false do |t|
      t.integer :related_student_id
      t.integer :main_student_id
    end
  end

  def self.down
    drop_table :related_students
  end
end
