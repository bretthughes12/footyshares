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

ActiveRecord::Schema.define(version: 20121010100523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "venue",               limit: 255
    t.integer  "round_id"
    t.boolean  "allow_only_one_team",             default: false, null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "matches", ["name"], name: "index_matches_on_name", using: :btree
  add_index "matches", ["round_id"], name: "index_matches_on_round_id", using: :btree

  create_table "rounds", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.datetime "cutoff_at"
    t.datetime "starts_at"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "shares_remaining",             default: 0
    t.integer  "prev_round_id"
  end

  add_index "rounds", ["name"], name: "index_rounds_on_name", using: :btree
  add_index "rounds", ["starts_at"], name: "index_rounds_on_starts_at", using: :btree

  create_table "shares", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.integer  "shares",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "shares", ["user_id", "team_id"], name: "index_shares_on_user_id_and_team_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.integer  "match_id"
    t.string   "name",       limit: 255,                 null: false
    t.boolean  "winner",                 default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "teams", ["match_id"], name: "index_teams_on_match_id", using: :btree
  add_index "teams", ["name"], name: "index_teams_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login",            limit: 255
    t.string   "name",             limit: 255
    t.string   "hashed_password",  limit: 255
    t.string   "salt",             limit: 255
    t.string   "email",            limit: 255
    t.string   "nickname",         limit: 255
    t.boolean  "admin",                        default: false
    t.integer  "shares_remaining",             default: 0
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "starting_shares",              default: 0
    t.boolean  "paid",                         default: false
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree

end
