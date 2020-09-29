# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_29_172353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_transactions", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "transaction_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_transactions_on_group_id"
    t.index ["transaction_id"], name: "index_group_transactions_on_transaction_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "groups_investments", id: false, force: :cascade do |t|
    t.bigint "groups_id"
    t.bigint "investments_id"
    t.index ["groups_id"], name: "index_groups_investments_on_groups_id"
    t.index ["investments_id"], name: "index_groups_investments_on_investments_id"
  end

  create_table "investments", force: :cascade do |t|
    t.integer "author_id"
    t.string "name"
    t.decimal "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "author_id"
    t.string "name"
    t.decimal "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "group_transactions", "groups"
  add_foreign_key "group_transactions", "transactions"
end
