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
    t.bigint "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.bigint "schedule_id"
    t.index ["location_id"], name: "index_branch_offices_on_location_id"
    t.index ["schedule_id"], name: "index_branch_offices_on_schedule_id", unique: true
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
    t.time "open_hour_sunday"
    t.time "close_hour_sunday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turns", force: :cascade do |t|
    t.date "date"
    t.time "hour"
    t.integer "state"
    t.string "reason"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "branch_office_id", null: false
    t.bigint "client_id", null: false
    t.bigint "staff_attended_id"
    t.index ["branch_office_id"], name: "index_turns_on_branch_office_id"
    t.index ["client_id"], name: "index_turns_on_client_id"
    t.index ["staff_attended_id"], name: "index_turns_on_staff_attended_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "rol", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "branch_office_id"
    t.index ["branch_office_id"], name: "index_users_on_branch_office_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "branch_offices", "locations"
  add_foreign_key "branch_offices", "schedules"
  add_foreign_key "turns", "branch_offices"
  add_foreign_key "turns", "users", column: "client_id"
  add_foreign_key "turns", "users", column: "staff_attended_id"
  add_foreign_key "users", "branch_offices"
end
