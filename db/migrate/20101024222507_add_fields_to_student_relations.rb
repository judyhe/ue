class AddFieldsToStudentRelations < ActiveRecord::Migration
  def self.up
    add_column :student_relations, :country_id, :integer
    add_column :student_relations, :income, :decimal, :precision => 8, :scale => 2
    add_column :student_relations, :tax_docs, :boolean, :default => true
    add_column :student_relations, :tax_docs_comment, :string
    add_column :student_relations, :language_proficiency_id, :integer
    add_column :student_relations, :citizenship_id, :integer
    
    create_table :language_proficiencies do |t|
      t.string :level
    end
    
    create_table :citizenships do |t|
      t.string :level
    end
  end

  def self.down
    remove_column :student_relations, :country_id
    remove_column :student_relations, :household_income
    remove_column :student_relations, :tax_docs
    remove_column :student_relations, :tax_docs_comment
    remove_column :student_relations, :language_proficiency_id
    remove_column :student_relations, :citizenship_id
    
    drop_table :language_proficiency
    drop_table :citizenship
  end
end
