# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_30_215228) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branch_offices", force: :cascade do |t|
    t.string "name"
    t.string "direc"
    t.integer "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "turns_id"
    t.bigint "location_id"
    t.bigint "users_id"
    t.index ["location_id"], name: "index_branch_offices_on_location_id", unique: true
    t.index ["turns_id"], name: "index_branch_offices_on_turns_id"
    t.index ["users_id"], name: "index_branch_offices_on_users_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "province"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.time "open_hour_monday"
    t.time "close_hour_monday"
    t.time "open_hour_tuesday"
    t.time "close_hour_tuesday"
    t.time "open_hour_wednesday"
    t.time "close_hour_wednesday"
    t.time "open_hour_thursday"
    t.time "close_hour_thursday"
    t.time "open_hour_friday"
    t.time "close_hour_friday"
    t.time "open_hour_saturday"
    t.time "close_hour_saturday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "branch_offices_id"
    t.index ["branch_offices_id"], name: "index_schedules_on_branch_offices_id", unique: true
  end

  create_table "turns", force: :cascade do |t|
    t.date "date"
    t.time "hour"
    t.integer "state"
    t.string "reason"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.index ["users_id"], name: "index_turns_on_users_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "branch_offices", "locations"
  add_foreign_key "branch_offices", "turns", column: "turns_id"
  add_foreign_key "branch_offices", "users", column: "users_id"
  add_foreign_key "schedules", "branch_offices", column: "branch_offices_id"
  add_foreign_key "turns", "users", column: "users_id"
end
