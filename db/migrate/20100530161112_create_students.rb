class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.integer :person_id
      t.string :gender, :limit => 1
      t.date :birth_date
      t.integer :grade_id
      t.integer :school_id
      t.integer :ethnicity_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
