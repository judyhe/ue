class CreateContactNumbers < ActiveRecord::Migration
  def self.up
    create_table :contact_numbers do |t|
      t.string :number
      t.integer :contact_number_type_id
      
      t.references :contactable, :polymorphic => true
    end
  end

  def self.down
    drop_table :contact_numbers
  end
end
