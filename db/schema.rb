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

ActiveRecord::Schema.define(:version => 20100627055303) do

  create_table "activities", :force => true do |t|
    t.string  "name"
    t.integer "parent_id"
  end

  create_table "activities_students", :id => false, :force => true do |t|
    t.integer "activity_id", :null => false
    t.integer "student_id",  :null => false
  end

  create_table "addresses", :force => true do |t|
    t.string  "address1"
    t.string  "address2"
    t.string  "city",             :limit => 100
    t.string  "zip",              :limit => 10
    t.integer "state_id"
    t.integer "county_id"
    t.integer "neighborhood_id"
    t.integer "addressable_id"
    t.string  "addressable_type"
  end

  create_table "assets", :force => true do |t|
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "attachings_count",  :default => 0
    t.datetime "created_at"
    t.datetime "data_updated_at"
  end

  create_table "attachings", :force => true do |t|
    t.integer  "attachable_id"
    t.integer  "asset_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachings", ["asset_id"], :name => "index_attachings_on_asset_id"
  add_index "attachings", ["attachable_id"], :name => "index_attachings_on_attachable_id"

  create_table "comments", :force => true do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_number_types", :force => true do |t|
    t.string "name"
  end

  create_table "contact_numbers", :force => true do |t|
    t.string  "number"
    t.integer "contact_number_type_id"
    t.integer "contactable_id"
    t.string  "contactable_type"
  end

  create_table "counties", :force => true do |t|
    t.string  "name",     :limit => 100, :null => false
    t.integer "state_id",                :null => false
  end

  create_table "ethnicities", :force => true do |t|
    t.string  "name", :null => false
    t.integer "ord"
  end

  create_table "grades", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "neighborhoods", :force => true do |t|
    t.string  "name",      :limit => 60, :null => false
    t.integer "county_id",               :null => false
    t.integer "ord",                     :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "first_name",          :limit => 100, :default => "", :null => false
    t.string   "last_name",           :limit => 100, :default => "", :null => false
    t.string   "gender",              :limit => 1
    t.string   "email",               :limit => 100
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_staff_types", :force => true do |t|
    t.string "position"
  end

  create_table "school_staffs", :force => true do |t|
    t.integer  "person_id"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "schools", :force => true do |t|
    t.string   "name",                               :default => "", :null => false
    t.string   "email",               :limit => 100
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

  create_table "student_relations", :force => true do |t|
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_relationship_types", :force => true do |t|
    t.string "name"
  end

  create_table "student_relationships", :force => true do |t|
    t.integer  "student_id"
    t.integer  "student_relation_id"
    t.integer  "student_relationship_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.integer  "person_id"
    t.date     "birth_date"
    t.integer  "grade_id"
    t.integer  "school_id"
    t.integer  "ethnicity_id"
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
