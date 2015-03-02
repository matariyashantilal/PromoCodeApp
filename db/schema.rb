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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150302053813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentication_tokens", force: true do |t|
    t.integer  "user_id"
    t.string   "auth_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses", force: true do |t|
    t.string   "business_name"
    t.string   "address"
    t.string   "contact_person"
    t.integer  "contact_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ibeacons", force: true do |t|
    t.string   "udid"
    t.string   "major"
    t.string   "minor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stores_id"
  end

  add_index "ibeacons", ["stores_id"], name: "index_ibeacons_on_stores_id", using: :btree

  create_table "offer_details", force: true do |t|
    t.integer  "users_id"
    t.integer  "offers_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_claimed", default: false
  end

  add_index "offer_details", ["offers_id"], name: "index_offer_details_on_offers_id", using: :btree
  add_index "offer_details", ["users_id"], name: "index_offer_details_on_users_id", using: :btree

  create_table "offers", force: true do |t|
    t.string   "offer_name"
    t.string   "task_to_perform"
    t.string   "offer_for"
    t.string   "offer_type"
    t.integer  "punch_count"
    t.datetime "offer_valid_upto"
    t.datetime "offer_expire_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stores_id"
  end

  add_index "offers", ["stores_id"], name: "index_offers_on_stores_id", using: :btree

  create_table "setting_contents", force: true do |t|
    t.text     "terms_condition"
    t.text     "about_us"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitute"
    t.string   "contact_person"
    t.integer  "contact_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "businesses_id"
  end

  add_index "stores", ["businesses_id"], name: "index_stores_on_businesses_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "type",                   default: "Customer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
