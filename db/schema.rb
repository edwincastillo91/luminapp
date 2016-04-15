# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160407002041) do

  create_table "artefacts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calendars", force: true do |t|
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "calendars_events", force: true do |t|
    t.integer "calendar_id"
    t.integer "event_id"
  end

  add_index "calendars_events", ["calendar_id"], name: "index_calendars_events_on_calendar_id"
  add_index "calendars_events", ["event_id"], name: "index_calendars_events_on_event_id"

  create_table "chapters", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "univers_id"
  end

  add_index "chapters", ["univers_id"], name: "index_chapters_on_univers_id"

  create_table "characters", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "drive"
    t.text     "wound"
    t.string   "eyes_color"
    t.string   "hair_color"
    t.integer  "height"
    t.integer  "weight"
    t.string   "race"
    t.string   "sex"
    t.boolean  "genetic_modification"
    t.string   "social_class"
    t.string   "sexual_orientation"
    t.string   "genre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "univers_id"
  end

  add_index "characters", ["univers_id"], name: "index_characters_on_univers_id"

  create_table "characters_relationships", force: true do |t|
    t.integer "character_id"
    t.integer "relationship_id"
  end

  add_index "characters_relationships", ["character_id"], name: "index_characters_relationships_on_character_id"
  add_index "characters_relationships", ["relationship_id"], name: "index_characters_relationships_on_relationship_id"

  create_table "comments", force: true do |t|
    t.string   "title"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "days", force: true do |t|
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "univers_id"
    t.string   "human_day"
  end

  add_index "days", ["univers_id"], name: "index_days_on_univers_id"

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "univers_id"
    t.integer  "place_id"
    t.integer  "day_id"
  end

  add_index "events", ["day_id"], name: "index_events_on_day_id"
  add_index "events", ["place_id"], name: "index_events_on_place_id"
  add_index "events", ["univers_id"], name: "index_events_on_univers_id"

  create_table "events_places", force: true do |t|
    t.integer "event_id"
    t.integer "place_id"
  end

  add_index "events_places", ["event_id"], name: "index_events_places_on_event_id"
  add_index "events_places", ["place_id"], name: "index_events_places_on_place_id"

  create_table "events_scenes", force: true do |t|
    t.integer "event_id"
    t.integer "scene_id"
  end

  add_index "events_scenes", ["event_id"], name: "index_events_scenes_on_event_id"
  add_index "events_scenes", ["scene_id"], name: "index_events_scenes_on_scene_id"

  create_table "experiences", force: true do |t|
    t.integer  "participation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experiences", ["participation_id"], name: "index_experiences_on_participation_id"

  create_table "memberships", force: true do |t|
    t.integer  "character_id"
    t.integer  "society_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["character_id"], name: "index_memberships_on_character_id"
  add_index "memberships", ["society_id"], name: "index_memberships_on_society_id"

  create_table "pages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participations", force: true do |t|
    t.integer  "character_id"
    t.integer  "event_id"
    t.integer  "experience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participations", ["character_id"], name: "index_participations_on_character_id"
  add_index "participations", ["event_id"], name: "index_participations_on_event_id"
  add_index "participations", ["experience_id"], name: "index_participations_on_experience_id"

  create_table "places", force: true do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "univers_id"
    t.string   "country"
    t.string   "subdivision"
    t.string   "city"
  end

  add_index "places", ["univers_id"], name: "index_places_on_univers_id"

  create_table "relationships", force: true do |t|
    t.string   "type"
    t.integer  "intensity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scene_orders", force: true do |t|
    t.integer  "order_value"
    t.integer  "story_id"
    t.integer  "scene_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scene_orders", ["scene_id"], name: "index_scene_orders_on_scene_id"
  add_index "scene_orders", ["story_id"], name: "index_scene_orders_on_story_id"

  create_table "scenes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scenes_stories", force: true do |t|
    t.integer "scene_id"
    t.integer "story_id"
  end

  add_index "scenes_stories", ["scene_id"], name: "index_scenes_stories_on_scene_id"
  add_index "scenes_stories", ["story_id"], name: "index_scenes_stories_on_story_id"

  create_table "societies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "univers_id"
  end

  add_index "stories", ["univers_id"], name: "index_stories_on_univers_id"

  create_table "universes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "user_id"
    t.boolean  "primary",    default: false
  end

  add_index "universes", ["user_id"], name: "index_universes_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
