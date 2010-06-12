class CreateStudentRelations < ActiveRecord::Migration
  def self.up
    create_table :student_relations do |t|
      t.integer :student_id
      t.integer :relation_id
      t.integer :relation_type_id
    end
  end

  def self.down
    drop_table :student_relations
  end
end
