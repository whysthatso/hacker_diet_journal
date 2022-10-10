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

ActiveRecord::Schema[7.0].define(version: 2022_08_22_110217) do
  create_table "intakes", force: :cascade do |t|
    t.string "description"
    t.integer "ean"
    t.integer "kcal_per_100"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "common_portion"
  end

  create_table "measurements", force: :cascade do |t|
    t.float "weight"
    t.datetime "when"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servings", force: :cascade do |t|
    t.integer "intake_id", null: false
    t.datetime "consumed_at"
    t.integer "kcal"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["intake_id"], name: "index_servings_on_intake_id"
  end

  add_foreign_key "servings", "intakes"
end
