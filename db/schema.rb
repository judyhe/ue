# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100530075051) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activities_students", :id => false, :force => true do |t|
    t.integer "activity_id", :null => false
  end

  create_table "counties", :force => true do |t|
    t.string  "name",     :limit => 100, :null => false
    t.integer "state_id",                :null => false
  end

  create_table "ethnicities", :force => true do |t|
    t.string  "name",  :null => false
    t.integer "order"
  end

  create_table "grades", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "neighborhoods", :force => true do |t|
    t.string  "name",      :limit => 60, :null => false
    t.integer "county_id",               :null => false
    t.integer "order",                   :null => false
  end

  create_table "schools", :force => true do |t|
    t.string   "name",                               :null => false
    t.string   "address1"
    t.string   "address2"
    t.string   "city",                :limit => 100
    t.string   "zip",                 :limit => 10
    t.integer  "state_id",                           :null => false
    t.integer  "county_id"
    t.integer  "neighborhood_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string "abbr", :limit => 2,  :null => false
    t.string "name", :limit => 40, :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "first_name",          :limit => 100, :default => "",   :null => false
    t.string   "last_name",           :limit => 100, :default => "",   :null => false
    t.string   "email",               :limit => 100
    t.string   "home_phone",          :limit => 20
    t.string   "cell_phone",          :limit => 20
    t.string   "address1"
    t.string   "address2"
    t.string   "city",                :limit => 100
    t.string   "zip",                 :limit => 10
    t.integer  "state_id",                                             :null => false
    t.integer  "county_id"
    t.integer  "neighborhood_id"
    t.date     "birth_date"
    t.integer  "grade_id"
    t.integer  "school_id"
    t.integer  "ethnicity_id"
    t.boolean  "active",                             :default => true
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "first_name",                :limit => 100, :default => ""
    t.string   "last_name",                 :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "phone",                     :limit => 20
    t.string   "title",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
