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

ActiveRecord::Schema.define(version: 2018_04_21_235806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.boolean "sporadic", null: false
    t.date "maturity", null: false
    t.boolean "active"
    t.bigint "dweller_id"
    t.bigint "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dweller_id"], name: "index_bills_on_dweller_id"
    t.index ["house_id"], name: "index_bills_on_house_id"
  end

  create_table "dweller_bills", force: :cascade do |t|
    t.decimal "value"
    t.boolean "paid"
    t.bigint "dweller_id"
    t.bigint "bill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_dweller_bills_on_bill_id"
    t.index ["dweller_id"], name: "index_dweller_bills_on_dweller_id"
  end

  create_table "dwellers", force: :cascade do |t|
    t.string "name"
    t.bigint "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_dwellers_on_house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bills", "dwellers"
  add_foreign_key "bills", "houses"
  add_foreign_key "dweller_bills", "bills"
  add_foreign_key "dweller_bills", "dwellers"
end
