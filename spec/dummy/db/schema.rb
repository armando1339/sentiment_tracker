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

ActiveRecord::Schema.define(version: 2020_10_12_001450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sentences", force: :cascade do |t|
    t.string "description"
    t.bigint "text_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["text_id"], name: "index_sentences_on_text_id"
  end

  create_table "sentiments", force: :cascade do |t|
    t.string "polarity"
    t.string "kind"
    t.string "entity_type"
    t.bigint "entity_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entity_type", "entity_id"], name: "index_sentiments_on_entity_type_and_entity_id"
  end

  create_table "texts", force: :cascade do |t|
    t.string "description"
    t.string "entity_type"
    t.bigint "entity_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entity_type", "entity_id"], name: "index_texts_on_entity_type_and_entity_id"
  end

  add_foreign_key "sentences", "texts"
end
