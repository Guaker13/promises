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

ActiveRecord::Schema.define(version: 20160329114221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.integer  "workspace_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "availabilities", ["workspace_id"], name: "index_availabilities_on_workspace_id", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.integer  "worker_id"
    t.integer  "workspace_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "bookings", ["worker_id"], name: "index_bookings_on_worker_id", using: :btree
  add_index "bookings", ["workspace_id"], name: "index_bookings_on_workspace_id", using: :btree

  create_table "businesses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.string   "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "businesses", ["user_id"], name: "index_businesses_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "workers", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "workers", ["user_id"], name: "index_workers_on_user_id", using: :btree

  create_table "workspaces", force: :cascade do |t|
    t.integer  "business_id"
    t.boolean  "wifi"
    t.integer  "capacity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "workspaces", ["business_id"], name: "index_workspaces_on_business_id", using: :btree

  add_foreign_key "availabilities", "workspaces"
  add_foreign_key "bookings", "workers"
  add_foreign_key "bookings", "workspaces"
  add_foreign_key "businesses", "users"
  add_foreign_key "workers", "users"
  add_foreign_key "workspaces", "businesses"
end
