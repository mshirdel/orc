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

ActiveRecord::Schema.define(version: 20160808130004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

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
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

end
