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

ActiveRecord::Schema.define(version: 20170529031138) do

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "company"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id"

  create_table "invoices", force: true do |t|
    t.string   "invoice_number"
    t.float    "amount"
    t.string   "date_sent"
    t.string   "date_due"
    t.string   "status"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["client_id"], name: "index_invoices_on_client_id"

  create_table "items", force: true do |t|
    t.string   "description"
    t.float    "unit_cost"
    t.float    "quantity"
    t.float    "discount",    default: 0.0
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["invoice_id"], name: "index_items_on_invoice_id"

  create_table "payment_details", force: true do |t|
    t.integer  "user_id"
    t.string   "bsb_number"
    t.string   "account_number"
    t.string   "abn_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payment_details", ["user_id"], name: "index_payment_details_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "ip_address"
    t.boolean  "is_admin",        default: false
    t.boolean  "activated",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
