class CreateTerms < ActiveRecord::Migration
  def self.up
    create_table :terms do |t|
      t.date :start
      t.date :end
      t.decimal :cost, :precision => 10, :scale => 2
      t.integer :program_id
      t.integer :address_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :terms
  end
end
