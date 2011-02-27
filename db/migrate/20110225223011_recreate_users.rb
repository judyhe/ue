class RecreateUsers < ActiveRecord::Migration
  def self.up
    drop_table :users
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :first_name, :limit => 100, :default => '', :null => true
      t.string :last_name, :limit => 100, :default => '', :null => true
      t.string :phone, :limist => 20
      t.string :title, :limit => 100
      t.string :role
      t.timestamps
    end
    
    add_index :users, :username, :unique => true
    add_index :users, :email, :unique => true
  end

  def self.down
    drop_table :users
    
    create_table "users", :force => true do |t|
      t.column :login,                     :string, :limit => 40
      t.column :first_name,                :string, :limit => 100, :default => '', :null => true
      t.column :last_name,                 :string, :limit => 100, :default => '', :null => true
      t.column :email,                     :string, :limit => 100
      t.column :phone,                     :string, :limit => 20
      t.column :title,                     :string, :limit => 100
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string, :limit => 40
      t.column :remember_token_expires_at, :datetime
    end
    
    add_index :users, :login, :unique => true
  end
end
