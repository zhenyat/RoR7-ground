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

ActiveRecord::Schema[7.0].define(version: 2023_05_29_125726) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "addressable_type", null: false
    t.integer "addressable_id", null: false
    t.integer "kind", limit: 1, default: 0, null: false
    t.string "postal_code"
    t.string "country", null: false
    t.string "region", null: false
    t.string "city", null: false
    t.string "street", null: false
    t.string "comment"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
  end

  create_table "banks", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.string "bic", null: false
    t.string "url"
    t.string "comment"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bic"], name: "index_banks_on_bic", unique: true
    t.index ["name"], name: "index_banks_on_name", unique: true
    t.index ["title"], name: "index_banks_on_title", unique: true
  end

  create_table "detail_sets", force: :cascade do |t|
    t.string "detailable_type", null: false
    t.integer "detailable_id", null: false
    t.string "inn", null: false
    t.string "kpp"
    t.string "ogrn"
    t.string "ogrnip"
    t.string "okpo"
    t.string "okato"
    t.string "certificate_number"
    t.date "certificate_date"
    t.string "comment"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detailable_type", "detailable_id"], name: "index_detail_sets_on_detailable"
    t.index ["inn"], name: "index_detail_sets_on_inn", unique: true
  end

  create_table "details", force: :cascade do |t|
    t.string "detailable_type", null: false
    t.integer "detailable_id", null: false
    t.string "inn", null: false
    t.string "kpp"
    t.string "ogrn"
    t.string "ogrnip"
    t.string "okpo"
    t.string "okato"
    t.string "certificate_number"
    t.date "certificate_date"
    t.string "comment"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["detailable_type", "detailable_id"], name: "index_details_on_detailable"
    t.index ["inn"], name: "index_details_on_inn", unique: true
  end

  create_table "emails", force: :cascade do |t|
    t.string "emailable_type", null: false
    t.integer "emailable_id", null: false
    t.integer "kind", limit: 1, default: 0, null: false
    t.string "address", null: false
    t.string "comment"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emailable_type", "emailable_id"], name: "index_emails_on_emailable"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.string "title", null: false
    t.integer "kind", limit: 1, default: 0, null: false
    t.integer "role", limit: 1, default: 0, null: false
    t.string "url"
    t.string "comment"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string "phoneable_type", null: false
    t.integer "phoneable_id", null: false
    t.integer "kind", limit: 1, default: 0, null: false
    t.string "country_code", default: "+7", null: false
    t.string "destination_code", null: false
    t.string "subscriber_number", null: false
    t.string "comment"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phoneable_type", "phoneable_id"], name: "index_phones_on_phoneable"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.string "colors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "samples", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.decimal "price", default: "0.0", null: false
    t.integer "quantity", default: 0, null: false
    t.integer "position"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_samples_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.integer "role", limit: 1, default: 0, null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "remember_digest"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
