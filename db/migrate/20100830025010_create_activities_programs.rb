class CreateActivitiesPrograms < ActiveRecord::Migration
  def self.up
    create_table :activities_programs, :id => false do |t|
      t.integer :activity_id, :null => false
      t.integer :program_id, :null => false
    end
  end

  def self.down
    drop_table :activities_programs
  end
end
