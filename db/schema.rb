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

ActiveRecord::Schema.define(version: 20160526210605) do

  create_table "fed_ex_billings", force: :cascade do |t|
    t.string   "account_number"
    t.datetime "inv_date"
    t.string   "inv_no"
    t.float    "cur_inv_bal"
    t.string   "track_no"
    t.float    "net_charge"
    t.string   "service"
    t.datetime "ship_date"
    t.datetime "del_date"
    t.datetime "del_time"
    t.string   "serv_area_code"
    t.string   "rec_zip"
    t.string   "ship_zip"
    t.string   "sat"
    t.string   "res"
    t.integer  "del_days"
    t.string   "request_format"
    t.datetime "date_time_import"
    t.boolean  "processed"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
