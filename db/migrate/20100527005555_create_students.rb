class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :first_name, :null => false, :limit => 100, :default => ''
      t.string :last_name, :null => false, :limit => 100, :default => ''
      t.string :email, :null => false, :limit => 100, :default => ''
      
      t.date :birth_date
      t.integer :grade_id
      
      t.integer :school_id
      t.integer :ethnicity_id
      
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
