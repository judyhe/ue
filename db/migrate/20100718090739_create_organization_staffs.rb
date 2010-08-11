class CreateOrganizationStaffs < ActiveRecord::Migration
  def self.up
    create_table :organization_staffs do |t|
      t.integer :person_id
      t.integer :organization_id
      t.integer :organization_staff_type_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :organization_staffs
  end
end
