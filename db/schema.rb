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

ActiveRecord::Schema.define(version: 2020_06_30_000621) do

  create_table "clients", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.string "phone", limit: 255
    t.string "address", limit: 255
    t.string "company", limit: 255
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "invoice_number", limit: 255
    t.float "amount"
    t.string "date_sent", limit: 255
    t.string "date_due", limit: 255
    t.string "status", limit: 255
    t.integer "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["client_id"], name: "index_invoices_on_client_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "description", limit: 255
    t.float "unit_cost"
    t.float "quantity"
    t.float "discount", default: 0.0
    t.integer "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["invoice_id"], name: "index_items_on_invoice_id"
  end

  create_table "payment_details", force: :cascade do |t|
    t.integer "user_id"
    t.string "bsb_number", limit: 255
    t.string "account_number", limit: 255
    t.string "abn_number", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name_for_invoice"
    t.string "email_for_invoice"
    t.index ["user_id"], name: "index_payment_details_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255
    t.string "password_digest", limit: 255
    t.string "ip_address", limit: 255
    t.boolean "is_admin", default: false
    t.boolean "activated", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
