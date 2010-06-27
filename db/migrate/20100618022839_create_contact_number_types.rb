class CreateContactNumberTypes < ActiveRecord::Migration
  def self.up
    create_table :contact_number_types do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :contact_number_types
  end
end
