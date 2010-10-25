class CreateLanguagesStudentRelations < ActiveRecord::Migration
  def self.up
    create_table :languages_student_relations, :id => false do |t|
      t.integer :language_id, :null => false
      t.integer :student_relation_id, :null => false
    end
  end

  def self.down
    drop_table :languages_student_relations
  end
  
end
