class CreateAgesPrograms < ActiveRecord::Migration
  def self.up
    create_table :ages_programs, :id => false do |t|
      t.integer :age_id, :null => false
      t.integer :program_id, :null => false
    end
  end

  def self.down
    drop_table :ages_programs
  end
end