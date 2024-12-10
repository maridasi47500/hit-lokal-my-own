# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_12_08_003427) do

  create_table "chansons", force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "url"
  end

  create_table "classements", force: :cascade do |t|
    t.integer "chanson_id"
    t.integer "semaine_no"
    t.integer "annee"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chanson_id"], name: "index_classements_on_chanson_id"
  end

  add_foreign_key "classements", "chansons"
end
