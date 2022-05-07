# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_07_064630) do
  create_table "account_books", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "users_id"
    t.string "month"
    t.integer "total_result"
    t.integer "total_earning"
    t.integer "total_food"
    t.integer "total_shopping"
    t.integer "total_culture"
    t.integer "total_education"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_account_books_on_users_id"
  end

  create_table "earning_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "account_books_id"
    t.string "description"
    t.integer "price"
    t.datetime "date"
    t.index ["account_books_id"], name: "index_earning_details_on_account_books_id"
    t.index ["users_id"], name: "index_earning_details_on_users_id"
  end

  create_table "spending_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "account_books_id"
    t.string "type"
    t.string "description"
    t.integer "price"
    t.datetime "date"
    t.index ["account_books_id"], name: "index_spending_details_on_account_books_id"
    t.index ["users_id"], name: "index_spending_details_on_users_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
