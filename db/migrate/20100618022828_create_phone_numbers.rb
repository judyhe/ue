class CreatePhoneNumbers < ActiveRecord::Migration
  def self.up
    create_table :phone_numbers do |t|
      t.string :number
      t.integer :person_id
      t.integer :phone_number_type_id
    end
  end

  def self.down
    drop_table :phone_numbers
  end
end
