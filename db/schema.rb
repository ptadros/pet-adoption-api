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

ActiveRecord::Schema.define(version: 2019_02_02_132826) do

  create_table "animal_lovers", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone_number", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animal_shelter_workers", force: :cascade do |t|
    t.string "name", null: false
    t.integer "animal_shelter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_shelter_id"], name: "index_animal_shelter_workers_on_animal_shelter_id"
  end

  create_table "animal_shelters", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animals", force: :cascade do |t|
    t.string "animal_picture", null: false
    t.string "medical_condition", null: false
    t.string "current_temporary_name", null: false
    t.string "supposed_race"
    t.boolean "is_adaptable", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "animal_shelter_id"
    t.integer "animal_lover_id"
    t.index ["animal_lover_id"], name: "index_animals_on_animal_lover_id"
    t.index ["animal_shelter_id"], name: "index_animals_on_animal_shelter_id"
  end

end
