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

ActiveRecord::Schema.define(:version => 20101128001035) do

  create_table "activities", :force => true do |t|
    t.string  "name"
    t.integer "parent_id"
  end

  create_table "activities_programs", :id => false, :force => true do |t|
    t.integer "activity_id", :null => false
    t.integer "program_id",  :null => false
  end

  create_table "activities_student_terms", :id => false, :force => true do |t|
    t.integer "activity_id",     :null => false
    t.integer "student_term_id", :null => false
  end

  add_index "activities_student_terms", ["activity_id"], :name => "index_activities_student_terms_on_activity_id"
  add_index "activities_student_terms", ["student_term_id"], :name => "index_activities_student_terms_on_student_term_id"

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

  create_table "ages", :force => true do |t|
    t.integer "age"
  end

  create_table "ages_programs", :id => false, :force => true do |t|
    t.integer "age_id",     :null => false
    t.integer "program_id", :null => false
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

  create_table "citizenships", :force => true do |t|
    t.string "level"
  end

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

  create_table "countries", :force => true do |t|
    t.string "name"
  end

  create_table "ethnicities", :force => true do |t|
    t.string  "name", :null => false
    t.integer "ord"
  end

  create_table "ethnicities_schools", :force => true do |t|
    t.integer "ethnicity_id"
    t.integer "school_id"
    t.decimal "percentage",   :precision => 5, :scale => 2
  end

  create_table "grades", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "grades_schools", :id => false, :force => true do |t|
    t.integer "grade_id",  :null => false
    t.integer "school_id", :null => false
  end

  create_table "language_proficiencies", :force => true do |t|
    t.string "level"
  end

  create_table "languages", :force => true do |t|
    t.string "name"
  end

  create_table "languages_student_relations", :id => false, :force => true do |t|
    t.integer "language_id",         :null => false
    t.integer "student_relation_id", :null => false
  end

  create_table "neighborhoods", :force => true do |t|
    t.string  "name",      :limit => 60, :null => false
    t.integer "county_id",               :null => false
    t.integer "ord",                     :null => false
  end

  create_table "organization_staff_types", :force => true do |t|
    t.string "position"
  end

  create_table "organization_staffs", :force => true do |t|
    t.integer  "person_id"
    t.integer  "organization_id"
    t.integer  "organization_staff_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organization_staffs_programs", :id => false, :force => true do |t|
    t.integer "organization_staff_id", :null => false
    t.integer "program_id",            :null => false
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payer_types", :force => true do |t|
    t.string "name", :null => false
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

  create_table "programs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender",          :limit => 2
    t.boolean  "scholarship",                  :default => false
  end

  create_table "school_staff_types", :force => true do |t|
    t.string "position"
  end

  create_table "school_staffs", :force => true do |t|
    t.integer  "person_id"
    t.integer  "school_id"
    t.integer  "school_staff_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", :force => true do |t|
    t.string   "name",                                                                  :default => "", :null => false
    t.string   "email",                    :limit => 100
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_count",                                                         :default => 0
    t.decimal  "minority_percentage",                     :precision => 5, :scale => 2
    t.decimal  "reduced_lunch_percentage",                :precision => 5, :scale => 2
  end

  create_table "states", :force => true do |t|
    t.string "abbr", :limit => 2,  :null => false
    t.string "name", :limit => 40, :null => false
  end

  create_table "student_relations", :force => true do |t|
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
    t.decimal  "income",                  :precision => 8, :scale => 2
    t.boolean  "tax_docs",                                              :default => true
    t.string   "tax_docs_comment"
    t.integer  "language_proficiency_id"
    t.integer  "citizenship_id"
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

  create_table "student_term_not_placed_reasons", :force => true do |t|
    t.string "reason", :null => false
  end

  create_table "student_term_payments", :force => true do |t|
    t.integer  "student_term_id",                                 :null => false
    t.decimal  "amount",           :precision => 10, :scale => 2
    t.integer  "payer_type_id",                                   :null => false
    t.string   "payer_type_other"
    t.integer  "payer_id",                                        :null => false
    t.string   "payer_type",                                      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_term_payments", ["payer_id", "payer_type"], :name => "index_student_term_payments_on_payer_id_and_payer_type"
  add_index "student_term_payments", ["payer_type_id"], :name => "index_student_term_payments_on_payer_type_id"
  add_index "student_term_payments", ["student_term_id"], :name => "index_student_term_payments_on_student_term_id"

  create_table "student_terms", :force => true do |t|
    t.integer  "student_id",                                                             :null => false
    t.integer  "term_id",                                                                :null => false
    t.datetime "application_date"
    t.decimal  "cost",                 :precision => 10, :scale => 2
    t.integer  "school_id"
    t.integer  "grade_id"
    t.decimal  "income",               :precision => 8,  :scale => 2
    t.decimal  "decimal",              :precision => 8,  :scale => 2
    t.boolean  "placed",                                              :default => false
    t.integer  "not_placed_reason_id"
    t.string   "not_placed_other"
    t.boolean  "completed",                                           :default => false
    t.boolean  "student_eval",                                        :default => false
    t.boolean  "program_eval",                                        :default => false
    t.boolean  "parent_eval",                                         :default => false
    t.boolean  "teacher_eval",                                        :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_terms", ["grade_id"], :name => "index_student_terms_on_grade_id"
  add_index "student_terms", ["not_placed_reason_id"], :name => "index_student_terms_on_not_placed_reason_id"
  add_index "student_terms", ["school_id"], :name => "index_student_terms_on_school_id"
  add_index "student_terms", ["student_id"], :name => "index_student_terms_on_student_id"
  add_index "student_terms", ["term_id"], :name => "index_student_terms_on_term_id"

  create_table "students", :force => true do |t|
    t.integer  "person_id"
    t.date     "birth_date"
    t.integer  "grade_id"
    t.integer  "school_id"
    t.integer  "ethnicity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "language_proficiency_id"
  end

  create_table "term_sessions", :force => true do |t|
    t.date     "day"
    t.time     "start"
    t.time     "end"
    t.integer  "term_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terms", :force => true do |t|
    t.date     "start"
    t.date     "end"
    t.decimal  "cost",       :precision => 10, :scale => 2
    t.integer  "program_id"
    t.integer  "address_id"
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
