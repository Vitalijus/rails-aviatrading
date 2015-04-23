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

ActiveRecord::Schema.define(version: 20150423193900) do

  create_table "adverts", force: true do |t|
    t.string   "title"
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "advert_image"
    t.string   "make"
    t.string   "model"
    t.string   "aircraft_type"
    t.integer  "year"
    t.string   "currency"
    t.integer  "price"
    t.string   "country"
    t.string   "city"
    t.string   "engine_type"
    t.integer  "number_of_engines"
    t.string   "engine_make"
    t.string   "engine_model"
    t.integer  "engine_hours"
    t.text     "engine_notes"
    t.integer  "tbo"
    t.string   "engine_power"
    t.integer  "number_of_propellers"
    t.string   "propeller_make"
    t.string   "propeller_model"
    t.integer  "propeller_hours"
    t.string   "serial_number"
    t.string   "registration_number"
    t.integer  "aircraft_hours"
    t.integer  "landings"
    t.string   "nearest_airport"
    t.string   "aircraft_status"
    t.datetime "last_inspection"
    t.boolean  "eu_vat"
    t.boolean  "price_on_request"
    t.string   "airport_code"
    t.string   "number_of_passengers"
    t.string   "aircraft_usage"
    t.string   "phone"
    t.integer  "user_id"
    t.string   "document"
    t.integer  "advert_duration",      default: 0
    t.boolean  "show_advert",          default: true
  end

  create_table "contacts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "message"
    t.string   "name"
    t.string   "email"
  end

  create_table "photos", force: true do |t|
    t.string   "advert_id"
    t.string   "public_token"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                     default: "",    null: false
    t.string   "encrypted_password",        default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.text     "about"
    t.string   "organisation"
    t.string   "street"
    t.string   "city"
    t.string   "country"
    t.integer  "telephone"
    t.string   "state"
    t.string   "postal_code"
    t.string   "cover_image"
    t.integer  "plan_id"
    t.string   "stripe_customer_token"
    t.string   "name_on_card"
    t.string   "coupon"
    t.string   "stripe_subscription_token"
    t.datetime "trial_ends"
    t.boolean  "paid"
    t.boolean  "active_account",            default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
