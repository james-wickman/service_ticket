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

ActiveRecord::Schema.define(version: 20170410213534) do

  create_table "costumers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "equipment_lists", force: :cascade do |t|
    t.string   "zone_number"
    t.string   "equipment_name"
    t.string   "location"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "equipment_useds", force: :cascade do |t|
    t.string   "part_number"
    t.string   "description"
    t.integer  "quantity"
    t.decimal  "price_per_unit"
    t.decimal  "extended_price"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "systems", force: :cascade do |t|
    t.string   "cs"
    t.string   "account"
    t.string   "rcvr"
    t.string   "instal_date"
    t.string   "sales_name"
    t.string   "instal_tech"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "ticket_number"
    t.string   "assigned_to"
    t.string   "primary_problem"
    t.string   "secondary_problem"
    t.string   "problem_reported"
    t.string   "equipment_sent"
    t.string   "work_performed"
    t.datetime "time_dispatched"
    t.datetime "time_arrival_on_site"
    t.datetime "time_departed_site"
    t.time     "total_site_time"
    t.boolean  "complete"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
