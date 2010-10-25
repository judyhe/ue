class AddFieldsToStudent < ActiveRecord::Migration
  def self.up
     add_column :students, :language_proficiency_id, :integer
  end

  def self.down
    remove_column :students, :language_proficiency_id
  end
end
