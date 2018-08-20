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

ActiveRecord::Schema.define(version: 2018_08_11_195002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_apportionments", force: :cascade do |t|
    t.bigint "bill_id"
    t.decimal "value"
    t.bigint "dweller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_bill_apportionments_on_bill_id"
    t.index ["dweller_id"], name: "index_bill_apportionments_on_dweller_id"
  end

  create_table "bill_months", force: :cascade do |t|
    t.date "month"
    t.integer "status"
    t.bigint "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_bill_months_on_house_id"
  end

  create_table "bill_splitings", force: :cascade do |t|
    t.decimal "value"
    t.bigint "dweller_id"
    t.bigint "bill_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "percentage_value"
    t.index ["bill_type_id"], name: "index_bill_splitings_on_bill_type_id"
    t.index ["dweller_id"], name: "index_bill_splitings_on_dweller_id"
  end

  create_table "bill_types", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.date "maturity", null: false
    t.decimal "value"
    t.bigint "dweller_id"
    t.bigint "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dweller_id"], name: "index_bill_types_on_dweller_id"
    t.index ["house_id"], name: "index_bill_types_on_house_id"
  end

  create_table "bills", force: :cascade do |t|
    t.decimal "paid_value"
    t.decimal "month_value"
    t.datetime "paid_date"
    t.datetime "maturity_date"
    t.bigint "bill_month_id"
    t.bigint "bill_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_month_id"], name: "index_bills_on_bill_month_id"
    t.index ["bill_type_id"], name: "index_bills_on_bill_type_id"
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

  create_table "month_bills", force: :cascade do |t|
    t.date "month"
    t.integer "status"
    t.bigint "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_month_bills_on_house_id"
  end

  add_foreign_key "bill_apportionments", "bills"
  add_foreign_key "bill_apportionments", "dwellers"
  add_foreign_key "bill_months", "houses"
  add_foreign_key "bill_splitings", "bill_types"
  add_foreign_key "bill_splitings", "dwellers"
  add_foreign_key "bill_types", "dwellers"
  add_foreign_key "bill_types", "houses"
  add_foreign_key "bills", "bill_months"
  add_foreign_key "bills", "bill_types"
end
