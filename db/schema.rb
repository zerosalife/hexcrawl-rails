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

ActiveRecord::Schema.define(version: 20160329020505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "maps", force: :cascade do |t|
    t.string   "code",       limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "maps", ["code"], name: "index_maps_on_code", unique: true, using: :btree

  create_table "tiles", force: :cascade do |t|
    t.boolean  "revealed"
    t.json     "data"
    t.text     "notes"
    t.integer  "map_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "x_coord"
    t.integer  "y_coord"
    t.boolean  "filled"
  end

  add_index "tiles", ["map_id"], name: "index_tiles_on_map_id", using: :btree
  add_index "tiles", ["x_coord"], name: "index_tiles_on_x_coord", using: :btree
  add_index "tiles", ["y_coord"], name: "index_tiles_on_y_coord", using: :btree

  add_foreign_key "tiles", "maps"
end
