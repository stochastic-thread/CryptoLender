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

ActiveRecord::Schema.define(version: 2019_05_05_060233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fund_requirements", force: :cascade do |t|
    t.decimal "amount"
    t.decimal "rate"
    t.integer "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lender_id"
    t.boolean "active", default: false
    t.boolean "financed", default: false
    t.index ["lender_id"], name: "index_fund_requirements_on_lender_id"
  end

  create_table "loan_inquiries", force: :cascade do |t|
    t.decimal "amount"
    t.decimal "rate"
    t.integer "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "borrower_id"
    t.index ["borrower_id"], name: "index_loan_inquiries_on_borrower_id"
  end

  create_table "loan_inquiry_details", force: :cascade do |t|
    t.string "project_name"
    t.string "damage_type"
    t.string "organization_type"
    t.string "damaged_address"
    t.string "city"
    t.string "state"
    t.boolean "insured"
    t.decimal "revenue"
    t.decimal "estimated_loss"
    t.integer "headcount"
    t.string "industry"
    t.string "date_established"
    t.boolean "previous_bankruptcy"
    t.integer "bankruptcy_count"
    t.string "mailing_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loans", force: :cascade do |t|
    t.decimal "principal_balance"
    t.decimal "interest_rate"
    t.integer "days_to_maturity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "borrower_id"
    t.bigint "lender_id"
    t.index ["borrower_id"], name: "index_loans_on_borrower_id"
    t.index ["lender_id"], name: "index_loans_on_lender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "investor_status", default: false
    t.string "first_name"
    t.string "last_name"
    t.string "routing_number"
    t.string "account_type"
    t.string "account_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "fund_requirements", "users", column: "lender_id"
  add_foreign_key "loan_inquiries", "users", column: "borrower_id"
  add_foreign_key "loans", "users", column: "borrower_id"
  add_foreign_key "loans", "users", column: "lender_id"
end
