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

ActiveRecord::Schema.define(version: 20161129095106) do

  create_table "gpios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "pin"
    t.integer  "gpio_number"
    t.integer  "of_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.bigint   "operating_seconds", default: 0
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "description"
    t.float    "value",       limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "sensor"
  end

  create_table "meters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "value"
    t.integer  "gpio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "pin"
  end

  create_table "sensors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "value",      limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "address"
    t.string   "location"
  end

  create_table "setpoints", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.float    "value",      limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "pin"
    t.integer  "sensor_id"
    t.integer  "gpio_id"
    t.index ["gpio_id"], name: "index_setpoints_on_gpio_id", using: :btree
    t.index ["sensor_id"], name: "index_setpoints_on_sensor_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "apikey"
  end

  add_foreign_key "setpoints", "gpios"
  add_foreign_key "setpoints", "sensors"
end
