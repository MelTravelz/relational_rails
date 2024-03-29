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

ActiveRecord::Schema.define(version: 2023_01_30_224430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artifacts", force: :cascade do |t|
    t.bigint "exhibit_id"
    t.string "name"
    t.string "material"
    t.string "year_created"
    t.integer "total_pieces"
    t.boolean "on_loan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exhibit_id"], name: "index_artifacts_on_exhibit_id"
  end

  create_table "exhibits", force: :cascade do |t|
    t.string "name"
    t.boolean "on_display"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "artifacts", "exhibits"
end
