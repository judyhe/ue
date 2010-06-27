class CreateStudentRelations < ActiveRecord::Migration
  def self.up
    create_table :student_relations do |t|
      t.integer :person_id
      t.timestamps
    end
  end

  def self.down
    drop_table :student_relations
  end
end
