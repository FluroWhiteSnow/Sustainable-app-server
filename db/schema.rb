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

ActiveRecord::Schema.define(version: 2021_07_20_020926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cups_totals", force: :cascade do |t|
    t.integer "coffee_cups_total"
    t.integer "reusable_cups_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_cups_totals_on_user_id"
  end

  create_table "travel_totals", force: :cascade do |t|
    t.float "walk_total_km"
    t.float "pt_total_km"
    t.float "drive_total_km"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_travel_totals_on_user_id"
  end

  create_table "user_co2_dailies", force: :cascade do |t|
    t.float "walk_co2"
    t.float "pt_co2"
    t.float "drive_co2"
    t.float "coffee_cups_co2"
    t.float "reusable_cups_co2"
    t.float "user_co2_daily_total"
    t.bigint "user_daily_id", null: false
    t.bigint "user_co2_total_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_co2_total_id"], name: "index_user_co2_dailies_on_user_co2_total_id"
    t.index ["user_daily_id"], name: "index_user_co2_dailies_on_user_daily_id"
  end

  create_table "user_co2_totals", force: :cascade do |t|
    t.float "walk_co2_total"
    t.float "pt_co2_total"
    t.float "drive_co2_total"
    t.float "coffee_cups_co2_total"
    t.float "reusable_cups_co2_total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_user_co2_totals_on_user_id"
  end

  create_table "user_dailies", force: :cascade do |t|
    t.boolean "walk"
    t.boolean "public_transport"
    t.boolean "drive"
    t.integer "coffee_cups"
    t.integer "reusable_cups"
    t.bigint "user_id", null: false
    t.bigint "cups_total_id", null: false
    t.bigint "travel_total_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cups_total_id"], name: "index_user_dailies_on_cups_total_id"
    t.index ["travel_total_id"], name: "index_user_dailies_on_travel_total_id"
    t.index ["user_id"], name: "index_user_dailies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.float "distance_from_work"
    t.string "email"
    t.string "department_code"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "cups_totals", "users"
  add_foreign_key "travel_totals", "users"
  add_foreign_key "user_co2_dailies", "user_co2_totals"
  add_foreign_key "user_co2_dailies", "user_dailies"
  add_foreign_key "user_co2_totals", "users"
  add_foreign_key "user_dailies", "cups_totals"
  add_foreign_key "user_dailies", "travel_totals"
  add_foreign_key "user_dailies", "users"
end
