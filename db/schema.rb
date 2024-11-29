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

ActiveRecord::Schema[7.1].define(version: 2024_11_29_144801) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meeting_intents", force: :cascade do |t|
    t.bigint "resto_id", null: false
    t.bigint "target_id", null: false
    t.bigint "initiator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["initiator_id"], name: "index_meeting_intents_on_initiator_id"
    t.index ["resto_id"], name: "index_meeting_intents_on_resto_id"
    t.index ["target_id"], name: "index_meeting_intents_on_target_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "resto_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resto_id"], name: "index_participations_on_resto_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "restos", force: :cascade do |t|
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code_name", null: false
    t.index ["code_name"], name: "index_restos_on_code_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pseudo", null: false
    t.string "role", default: "user"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "meeting_intents", "users", column: "initiator_id"
  add_foreign_key "meeting_intents", "users", column: "target_id"
end
