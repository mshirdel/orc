# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160827193053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audios", force: :cascade do |t|
    t.string   "lang"
    t.string   "p_type"
    t.string   "url"
    t.integer  "pronounciation_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "audios", ["pronounciation_id"], name: "index_audios_on_pronounciation_id", using: :btree

  create_table "examples", force: :cascade do |t|
    t.text     "text"
    t.integer  "sense_id"
    t.string   "audio_type"
    t.string   "audio_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "examples", ["sense_id"], name: "index_examples_on_sense_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "headwords", force: :cascade do |t|
    t.string   "dataset"
    t.string   "headword"
    t.string   "headword_id"
    t.string   "part_of_speech"
    t.string   "url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lessons", ["group_id"], name: "index_lessons_on_group_id", using: :btree

  create_table "pearsons", force: :cascade do |t|
    t.string   "word"
    t.text     "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pronounciations", force: :cascade do |t|
    t.string   "ipa"
    t.integer  "headword_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "pronounciations", ["headword_id"], name: "index_pronounciations_on_headword_id", using: :btree

  create_table "senses", force: :cascade do |t|
    t.string   "definition"
    t.integer  "headword_id"
    t.string   "opposite"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "senses", ["headword_id"], name: "index_senses_on_headword_id", using: :btree

  add_foreign_key "lessons", "groups"
end
