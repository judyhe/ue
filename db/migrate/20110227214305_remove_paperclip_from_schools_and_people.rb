class RemovePaperclipFromSchoolsAndPeople < ActiveRecord::Migration
  def self.up
    remove_column :schools, :avatar_file_name
    remove_column :schools, :avatar_content_type
    remove_column :schools, :avatar_file_size
    remove_column :schools, :avatar_updated_at
    
    remove_column :people, :avatar_file_name
    remove_column :people, :avatar_content_type
    remove_column :people, :avatar_file_size
    remove_column :people, :avatar_updated_at
  end

  def self.down
    add_column :schools, :avatar_file_name, :string
    add_column :schools, :avatar_content_type, :string
    add_column :schools, :avatar_file_size, :integer
    add_column :schools, :avatar_updated_at, :datetime
    
    add_column :people, :avatar_file_name, :string
    add_column :people, :avatar_content_type, :string
    add_column :people, :avatar_file_size, :integer
    add_column :people, :avatar_updated_at, :datetime
  end
end
