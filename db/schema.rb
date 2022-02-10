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

ActiveRecord::Schema.define(version: 2022_02_10_183152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "names", null: false
    t.string "surnames", null: false
    t.date "birth", null: false
    t.date "death"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "book_characters", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id", "character_id"], name: "index_book_characters_on_book_id_and_character_id", unique: true
    t.index ["book_id"], name: "index_book_characters_on_book_id"
    t.index ["character_id"], name: "index_book_characters_on_character_id"
  end

  create_table "book_copies", force: :cascade do |t|
    t.string "isnb", null: false
    t.string "state", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_book_copies_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.string "type_book", null: false
    t.integer "year", null: false
    t.bigint "author_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["genre_id"], name: "index_books_on_genre_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_human", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "loans", force: :cascade do |t|
    t.datetime "loan_date", null: false
    t.datetime "expiration_date", null: false
    t.datetime "return_date"
    t.bigint "user_id", null: false
    t.bigint "book_copy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_copy_id"], name: "index_loans_on_book_copy_id"
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "book_characters", "books"
  add_foreign_key "book_characters", "characters"
  add_foreign_key "book_copies", "books"
  add_foreign_key "books", "authors"
  add_foreign_key "books", "genres"
  add_foreign_key "loans", "book_copies"
  add_foreign_key "loans", "users"
end
