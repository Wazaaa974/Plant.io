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

ActiveRecord::Schema[8.1].define(version: 2026_04_25_172156) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "plant_events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "event_type"
    t.text "notes"
    t.datetime "occurred_at"
    t.bigint "plant_id", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "xp_delta"
    t.index ["plant_id"], name: "index_plant_events_on_plant_id"
  end

  create_table "plant_photos", force: :cascade do |t|
    t.string "ai_analysis_status"
    t.text "ai_health_summary"
    t.string "ai_species_guess"
    t.datetime "created_at", null: false
    t.text "notes"
    t.bigint "plant_id", null: false
    t.datetime "taken_at"
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_plant_photos_on_plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.date "acquired_at"
    t.string "common_name"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "growth_stage", default: "seedling", null: false
    t.integer "level", default: 1, null: false
    t.string "location_name"
    t.string "nickname", null: false
    t.string "species_name", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "xp", default: 0, null: false
    t.index ["growth_stage"], name: "index_plants_on_growth_stage"
    t.index ["user_id"], name: "index_plants_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "plant_events", "plants"
  add_foreign_key "plant_photos", "plants"
  add_foreign_key "plants", "users"
  add_foreign_key "sessions", "users"
end
