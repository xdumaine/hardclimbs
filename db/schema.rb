# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130202143419) do

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.string   "slug"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "climbs_count",  :default => 0
    t.integer  "ascents_count", :default => 0
  end

  add_index "areas", ["slug"], :name => "index_areas_on_slug", :unique => true

  create_table "ascents", :force => true do |t|
    t.date     "date"
    t.integer  "climb_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "climber_id"
    t.string   "slug"
    t.integer  "grade_id"
    t.integer  "ascent_number"
    t.integer  "medias_count",  :default => 0
  end

  add_index "ascents", ["slug"], :name => "index_ascents_on_slug", :unique => true

  create_table "climbers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "sex"
    t.date     "dob"
    t.integer  "height"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "slug"
    t.integer  "climbs_count",  :default => 0
    t.integer  "ascents_count", :default => 0
  end

  add_index "climbers", ["slug"], :name => "index_climbers_on_slug", :unique => true

  create_table "climbs", :force => true do |t|
    t.string   "name"
    t.integer  "style_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "slug"
    t.boolean  "still_hard"
    t.integer  "area_id"
    t.integer  "climbers_count", :default => 0
    t.integer  "ascents_count",  :default => 0
    t.integer  "medias_count",   :default => 0
  end

  add_index "climbs", ["slug"], :name => "index_climbs_on_slug", :unique => true

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "grades", :force => true do |t|
    t.string   "name"
    t.integer  "rank"
    t.integer  "style_id"
    t.string   "slug"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "ascents_count", :default => 0
  end

  add_index "grades", ["slug"], :name => "index_grades_on_slug", :unique => true

  create_table "media_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "medias", :force => true do |t|
    t.string   "url"
    t.string   "description"
    t.integer  "media_type_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "climb_id"
    t.integer  "ascent_id"
    t.text     "pull_quote"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "styles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
