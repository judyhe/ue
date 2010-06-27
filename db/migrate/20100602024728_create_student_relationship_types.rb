class CreateStudentRelationshipTypes < ActiveRecord::Migration
  def self.up
    create_table :student_relationship_types do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :student_relationship_types
  end
end
