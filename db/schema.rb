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

ActiveRecord::Schema[8.0].define(version: 2025_03_06_050528) do
# Could not dump table "order_items" because of following StandardError
#   Unknown type 'uuid' for column 'id'


# Could not dump table "orders" because of following StandardError
#   Unknown type 'uuid' for column 'id'


# Could not dump table "payments" because of following StandardError
#   Unknown type 'uuid' for column 'id'


# Could not dump table "products" because of following StandardError
#   Unknown type 'uuid' for column 'id'


  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", null: false
    t.string "role", default: "customer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "users", column: "customer_id"
  add_foreign_key "payments", "orders"
  add_foreign_key "products", "users", column: "seller_id"
end
