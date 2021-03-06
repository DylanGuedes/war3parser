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

ActiveRecord::Schema.define(version: 20150419155329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "news", force: :cascade do |t|
    t.text     "content"
    t.string   "subject"
    t.string   "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "replay_headers", force: :cascade do |t|
    t.integer  "version",    default: 0
    t.text     "intro",      default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "replays", force: :cascade do |t|
    t.boolean  "parse_actions", default: true
    t.boolean  "parse_chat",    default: true
    t.string   "file_name"
    t.text     "header"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "fp",            default: ""
    t.text     "data",          default: ""
    t.string   "replay_file"
    t.text     "description",   default: " "
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
