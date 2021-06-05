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

ActiveRecord::Schema.define(version: 2021_06_04_231807) do

  create_table "bike_stoles", force: :cascade do |t|
    t.string "no"
    t.string "case"
    t.string "date"
    t.string "time"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "car_stoles", force: :cascade do |t|
    t.string "no"
    t.string "case"
    t.string "date"
    t.string "time"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cctv_coors", force: :cascade do |t|
    t.string "no"
    t.float "lat"
    t.float "lng"
    t.string "dir"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cctvs", force: :cascade do |t|
    t.string "no"
    t.string "ps"
    t.string "addr"
    t.string "direction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "home_stoles", force: :cascade do |t|
    t.string "no"
    t.string "case"
    t.string "date"
    t.string "time"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ps_addrs", force: :cascade do |t|
    t.string "name"
    t.string "content"
    t.string "traffic_information"
    t.string "display_addr"
    t.string "poi_addr"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ps_coors", force: :cascade do |t|
    t.string "no"
    t.float "lat"
    t.float "lng"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scooter_stoles", force: :cascade do |t|
    t.string "no"
    t.string "case"
    t.string "date"
    t.string "time"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
