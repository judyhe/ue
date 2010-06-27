class CreateStudentRelationships < ActiveRecord::Migration
  def self.up
    create_table :student_relationships do |t|
      t.integer :student_id
      t.integer :student_relation_id
      
      t.integer :student_relationship_type_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :student_relationships
  end
end
