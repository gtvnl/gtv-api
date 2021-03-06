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

ActiveRecord::Schema.define(version: 20180130132035) do

  create_table "gpios", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "pin"
    t.integer "gpio_number"
    t.integer "of_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "operating_seconds"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean "is_on", default: false
  end

  create_table "logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "description"
    t.float "value", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sensor"
    t.float "setpoint_value", limit: 24
  end

  create_table "sensors", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.float "value", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
  end

  create_table "setpoints", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.float "value", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pin"
    t.integer "sensor_id"
    t.integer "gpio_id"
    t.float "max_temp_difference", limit: 24, default: 0.0
    t.index ["gpio_id"], name: "index_setpoints_on_gpio_id"
    t.index ["sensor_id"], name: "index_setpoints_on_sensor_id"
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "apikey"
  end

  add_foreign_key "setpoints", "gpios"
  add_foreign_key "setpoints", "sensors"
end
