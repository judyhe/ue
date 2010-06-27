class CreateSchoolStaffTypes < ActiveRecord::Migration
  def self.up
    create_table :school_staff_types do |t|
      t.string :position
    end
  end

  def self.down
    drop_table :school_staff_types
  end
end
