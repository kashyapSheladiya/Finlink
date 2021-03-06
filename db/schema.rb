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

ActiveRecord::Schema.define(version: 2021_03_06_144820) do

  create_table "api_v1_readings", force: :cascade do |t|
    t.integer "thermostat_id"
    t.integer "number"
    t.decimal "temperature"
    t.decimal "humidity"
    t.decimal "battery_charge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thermostat_id"], name: "index_api_v1_readings_on_thermostat_id"
  end

  create_table "api_v1_thermostats", force: :cascade do |t|
    t.text "household_token"
    t.text "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
