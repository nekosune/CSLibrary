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

ActiveRecord::Schema.define(version: 20130903120422) do

  create_table "authors", force: true do |t|
    t.string   "name"
    t.string   "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authors_stories", id: false, force: true do |t|
    t.integer "story_id",  null: false
    t.integer "author_id", null: false
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_stories", id: false, force: true do |t|
    t.integer "story_id",    null: false
    t.integer "category_id", null: false
  end

  create_table "chapters", force: true do |t|
    t.string   "name"
    t.integer  "number"
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chapters", ["story_id"], name: "index_chapters_on_story_id"

  create_table "stories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "stories_tags", id: false, force: true do |t|
    t.integer "story_id", null: false
    t.integer "tag_id",   null: false
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
