class CreateOrganizationStaffsPrograms < ActiveRecord::Migration
  def self.up
    create_table :organization_staffs_programs, :id => false do |t|
      t.integer :organization_staff_id, :null => false
      t.integer :program_id, :null => false
    end
  end

  def self.down
    drop_table :organization_staffs_programs
  end
end
