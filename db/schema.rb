# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_160_319_090_117) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_admin_comments', id: :serial, force: :cascade do |t|
    t.string 'resource_id', null: false
    t.string 'resource_type', null: false
    t.string 'author_type'
    t.integer 'author_id'
    t.text 'body'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.string 'namespace'
    t.index %w[author_type author_id], name: 'index_active_admin_comments_on_author_type_and_author_id'
    t.index ['namespace'], name: 'index_active_admin_comments_on_namespace'
    t.index %w[resource_type resource_id], name: 'index_active_admin_comments_on_resource_type_and_resource_id'
  end

  create_table 'admin_users', id: :serial, force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index ['email'], name: 'index_admin_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_admin_users_on_reset_password_token', unique: true
  end

  create_table 'controllers', id: :serial, force: :cascade do |t|
    t.string 'Pages'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'friendly_id_slugs', id: :serial, force: :cascade do |t|
    t.string 'slug', null: false
    t.integer 'sluggable_id', null: false
    t.string 'sluggable_type', limit: 40
    t.datetime 'created_at'
    t.index %w[slug sluggable_type], name: 'index_friendly_id_slugs_on_slug_and_sluggable_type', unique: true
    t.index ['sluggable_id'], name: 'index_friendly_id_slugs_on_sluggable_id'
    t.index ['sluggable_type'], name: 'index_friendly_id_slugs_on_sluggable_type'
  end

  create_table 'issues', id: :serial, force: :cascade do |t|
    t.string 'title'
    t.string 'issue_number'
    t.integer 'position'
    t.string 'cover_image_file_name'
    t.string 'cover_image_content_type'
    t.bigint 'cover_image_file_size'
    t.datetime 'cover_image_updated_at'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.string 'slug'
    t.integer 'rating'
    t.integer 'pages_count'
    t.string 'purchase_url'
    t.text 'description'
    t.index ['slug'], name: 'index_issues_on_slug'
  end

  create_table 'pages', id: :serial, force: :cascade do |t|
    t.integer 'story_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.string 'image_file_name'
    t.string 'image_content_type'
    t.bigint 'image_file_size'
    t.datetime 'image_updated_at'
    t.integer 'story_page_number'
    t.integer 'issue_id'
    t.integer 'issue_page_number'
    t.text 'description'
    t.index ['story_id'], name: 'index_pages_on_story_id'
  end

  create_table 'people', id: :serial, force: :cascade do |t|
    t.string 'name'
    t.text 'bio'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.string 'image_file_name'
    t.string 'image_content_type'
    t.bigint 'image_file_size'
    t.datetime 'image_updated_at'
    t.string 'slug'
    t.index ['slug'], name: 'index_people_on_slug'
  end

  create_table 'people_stories', id: :serial, force: :cascade do |t|
    t.integer 'story_id'
    t.integer 'person_id'
    t.index ['person_id'], name: 'index_people_stories_on_person_id'
    t.index ['story_id'], name: 'index_people_stories_on_story_id'
  end

  create_table 'stories', id: :serial, force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.string 'cover_image_file_name'
    t.string 'cover_image_content_type'
    t.bigint 'cover_image_file_size'
    t.datetime 'cover_image_updated_at'
    t.string 'slug'
    t.text 'description'
    t.integer 'pages_count'
    t.integer 'rating'
    t.boolean 'unfinished'
    t.index ['slug'], name: 'index_stories_on_slug'
  end
end
