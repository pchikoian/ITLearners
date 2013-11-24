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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131027162836) do

  create_table "raw_data", :force => true do |t|
    t.string   "car_class"
    t.string   "cripple"
    t.string   "dinning"
    t.string   "line"
    t.string   "line_dir"
    t.string   "note"
    t.string   "over_night_stn"
    t.string   "package"
    t.string   "route"
    t.string   "train"
    t.string   "type"
    t.string   "arr_time"
    t.string   "dep_time"
    t.string   "order"
    t.string   "time_route"
    t.string   "station"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end