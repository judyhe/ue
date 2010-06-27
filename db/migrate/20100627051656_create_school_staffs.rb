class CreateSchoolStaffs < ActiveRecord::Migration
  def self.up
    create_table :school_staffs do |t|
      t.integer :person_id
      t.integer :school_id
      t.integer :school_staff_type_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :school_staffs
  end
end
