class CreateGrades < ActiveRecord::Migration
  def self.up
    create_table :grades do |t|
      t.string :name, :null => false
    end
  end

  def self.down
    drop_table :grades
  end
end
