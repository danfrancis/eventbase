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

ActiveRecord::Schema.define(:version => 20121009015917) do

  create_table "attendances", :force => true do |t|
    t.string   "attending_type"
    t.integer  "attending_id"
    t.integer  "event_id"
    t.string   "role"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "organizer"
    t.integer  "venue_id"
    t.datetime "event_start_date"
    t.datetime "event_end_date"
    t.datetime "reg_start_date"
    t.datetime "reg_end_date"
    t.string   "reg_url"
    t.string   "price"
    t.text     "description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "perma_name"
  end

  create_table "filters", :force => true do |t|
    t.string   "title"
    t.string   "filterable_type"
    t.integer  "filterable_id"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "lists", :force => true do |t|
    t.string   "name"
    t.string   "list_type"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pg_search_documents", :force => true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "sectors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.integer  "sector_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "trackers", :force => true do |t|
    t.string   "email_frequency"
    t.integer  "user_id"
    t.integer  "tracking_id"
    t.string   "tracking_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "list_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.integer  "sign_in_times"
    t.datetime "last_login"
    t.boolean  "admin"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "lat"
    t.string   "long"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "zip_code"
  end

end
