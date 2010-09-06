class CreateTermSessions < ActiveRecord::Migration
  def self.up
    create_table :term_sessions do |t|
      t.date :day
      t.time :start
      t.time :end
      t.integer :term_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :term_sessions
  end
end
