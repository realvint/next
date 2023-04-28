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

ActiveRecord::Schema[7.0].define(version: 2023_04_26_121101) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "counterparties", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone"], name: "index_counterparties_on_phone", unique: true
  end

  create_table "phones", force: :cascade do |t|
    t.string "value", null: false
    t.bigint "counterparty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["counterparty_id"], name: "index_phones_on_counterparty_id"
    t.index ["value"], name: "index_phones_on_value", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "title", null: false
    t.string "sku"
    t.string "barcode"
    t.integer "in_stock", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barcode"], name: "index_products_on_barcode", unique: true
    t.index ["sku"], name: "index_products_on_sku", unique: true
    t.index ["title"], name: "index_products_on_title", unique: true
  end

  add_foreign_key "phones", "counterparties"
end
