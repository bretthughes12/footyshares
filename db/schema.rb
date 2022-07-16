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

ActiveRecord::Schema.define(version: 2012_10_10_100523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "venue"
    t.integer "round_id"
    t.boolean "allow_only_one_team", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_matches_on_name"
    t.index ["round_id"], name: "index_matches_on_round_id"
  end

  create_table "rounds", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "cutoff_at"
    t.datetime "starts_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "shares_remaining", default: 0
    t.integer "prev_round_id"
    t.index ["name"], name: "index_rounds_on_name"
    t.index ["starts_at"], name: "index_rounds_on_starts_at"
  end

  create_table "shares", id: :serial, force: :cascade do |t|
    t.integer "team_id"
    t.integer "user_id"
    t.integer "shares", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id", "team_id"], name: "index_shares_on_user_id_and_team_id"
  end

  create_table "teams", id: :serial, force: :cascade do |t|
    t.integer "match_id"
    t.string "name", null: false
    t.boolean "winner", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["match_id"], name: "index_teams_on_match_id"
    t.index ["name"], name: "index_teams_on_name"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "login"
    t.string "name"
    t.string "hashed_password"
    t.string "salt"
    t.string "email"
    t.string "nickname"
    t.boolean "admin", default: false
    t.integer "shares_remaining", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "starting_shares", default: 0
    t.boolean "paid", default: false
    t.index ["login"], name: "index_users_on_login", unique: true
  end

end
