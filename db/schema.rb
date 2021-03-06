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

ActiveRecord::Schema.define(version: 20171115215100) do

  create_table "auth", force: :cascade do |t|
    t.string "uuid"
    t.string "token"
  end

  create_table "countries", force: :cascade do |t|
    t.string  "country_code"
    t.integer "panel_provider_id"
  end

  create_table "location_groups", force: :cascade do |t|
    t.string  "name"
    t.integer "panel_provider_id"
    t.integer "country_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string  "name"
    t.integer "external_id"
    t.string  "secret_code"
  end

  create_table "panel_providers", force: :cascade do |t|
    t.string "code"
    t.string "type"
  end

  create_table "target_groups", force: :cascade do |t|
    t.string  "name"
    t.integer "external_id"
    t.string  "secret_code"
    t.integer "parent_id"
    t.integer "panel_provider_id"
  end

  add_index "target_groups", ["external_id", "secret_code"], name: "index_target_groups_on_external_id_and_secret_code", unique: true
  add_index "target_groups", ["parent_id"], name: "index_target_groups_on_parent_id"

end
