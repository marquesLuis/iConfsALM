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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130613114140) do

  create_table "about_events", :force => true do |t|
    t.integer  "note_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "about_events", ["event_id"], :name => "index_about_events_on_event_id"
  add_index "about_events", ["note_id"], :name => "index_about_events_on_note_id"

  create_table "about_people", :force => true do |t|
    t.integer  "person_id"
    t.integer  "note_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "about_people", ["note_id"], :name => "index_about_people_on_note_id"
  add_index "about_people", ["person_id"], :name => "index_about_people_on_person_id"

  create_table "administrators", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "administrators", ["email"], :name => "index_administrators_on_email", :unique => true
  add_index "administrators", ["reset_password_token"], :name => "index_administrators_on_reset_password_token", :unique => true

  create_table "area_of_interests", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "area_of_interests", ["updated_at"], :name => "index_area_of_interests_on_updated_at"

  create_table "atending_events", :force => true do |t|
    t.integer  "event_id"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "atending_events", ["event_id"], :name => "index_atending_events_on_event_id"
  add_index "atending_events", ["person_id"], :name => "index_atending_events_on_person_id"

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.integer  "document_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "person_id"
  end

  add_index "authors", ["document_id"], :name => "index_authors_on_document_id"
  add_index "authors", ["person_id"], :name => "index_authors_on_person_id"

  create_table "documents", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "event_documents", :force => true do |t|
    t.integer  "document_id"
    t.integer  "event_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "event_documents", ["document_id"], :name => "index_event_documents_on_document_id"
  add_index "event_documents", ["event_id"], :name => "index_event_documents_on_event_id"

  create_table "event_groups", :force => true do |t|
    t.datetime "date"
    t.time     "end"
    t.integer  "location_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "event_groups", ["location_id"], :name => "index_event_groups_on_location_id"

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "event_kind"
    t.time     "begin"
    t.time     "end"
    t.integer  "event_group_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "events", ["event_group_id"], :name => "index_events_on_event_group_id"
  add_index "events", ["updated_at"], :name => "index_events_on_updated_at"

  create_table "feedbacks", :force => true do |t|
    t.text     "content"
    t.boolean  "read",       :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "group_areas", :force => true do |t|
    t.integer  "event_group_id"
    t.integer  "area_of_interest_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "group_areas", ["area_of_interest_id"], :name => "index_group_areas_on_area_of_interest_id"
  add_index "group_areas", ["event_group_id"], :name => "index_group_areas_on_event_group_id"

  create_table "infos", :force => true do |t|
    t.string   "value"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "info_type"
  end

  add_index "infos", ["person_id"], :name => "index_infos_on_person_id"

  create_table "locations", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "maps_versions", :force => true do |t|
    t.integer  "version"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.text     "content"
    t.boolean  "read",       :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "email"
  end

  create_table "networking_interests", :force => true do |t|
    t.integer  "networking_id"
    t.integer  "area_of_interest_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "networking_interests", ["area_of_interest_id"], :name => "index_networking_interests_on_area_of_interest_id"
  add_index "networking_interests", ["networking_id"], :name => "index_networking_interests_on_networking_id"

  create_table "networkings", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "networkings", ["person_id"], :name => "index_networkings_on_person_id"
  add_index "networkings", ["updated_at"], :name => "index_networkings_on_updated_at"

  create_table "notes", :force => true do |t|
    t.text     "content"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "notes", ["person_id"], :name => "index_notes_on_person_id"

  create_table "org_notifications", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "org_notifications", ["updated_at"], :name => "index_org_notifications_on_updated_at"

  create_table "pending_contacts", :force => true do |t|
    t.integer  "requester_id"
    t.integer  "requested_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "pending_contacts", ["requested_id"], :name => "index_pending_contacts_on_requested_id"
  add_index "pending_contacts", ["requester_id"], :name => "index_pending_contacts_on_requester_id"

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "prefix"
    t.string   "affiliation"
    t.string   "email"
    t.string   "photo"
    t.text     "biography"
    t.integer  "calendar_version"
    t.datetime "info_modification_time"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "signup_code"
    t.integer  "theme",                  :default => 1
  end

  add_index "people", ["updated_at"], :name => "index_people_on_updated_at"

  create_table "person_interests", :force => true do |t|
    t.integer  "person_id"
    t.integer  "area_of_interest_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "person_interests", ["area_of_interest_id"], :name => "index_person_interests_on_area_of_interest_id"
  add_index "person_interests", ["person_id"], :name => "index_person_interests_on_person_id"

  create_table "program_versions", :force => true do |t|
    t.integer  "version"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "registries", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.integer  "person_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "registries", ["authentication_token"], :name => "index_registries_on_authentication_token", :unique => true
  add_index "registries", ["email"], :name => "index_registries_on_email", :unique => true
  add_index "registries", ["reset_password_token"], :name => "index_registries_on_reset_password_token", :unique => true

  create_table "rejected_contacts", :force => true do |t|
    t.integer  "requester_id"
    t.integer  "requested_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "rejected_contacts", ["requested_id"], :name => "index_rejected_contacts_on_requested_id"
  add_index "rejected_contacts", ["requester_id"], :name => "index_rejected_contacts_on_requester_id"

  create_table "removed_areas", :force => true do |t|
    t.integer  "area_identifier"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "removed_attending_events", :force => true do |t|
    t.integer  "removed_event"
    t.integer  "person_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "removed_attending_events", ["person_id"], :name => "index_removed_attending_events_on_person_id"

  create_table "removed_authors", :force => true do |t|
    t.integer  "author_identifier"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "removed_events", :force => true do |t|
    t.integer  "event_identifier"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "removed_infos", :force => true do |t|
    t.integer  "info_identifier"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "removed_locations", :force => true do |t|
    t.integer  "server_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "removed_networkings", :force => true do |t|
    t.integer  "net_identifier"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "removed_notes", :force => true do |t|
    t.integer  "sequence_number"
    t.integer  "person_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "removed_notes", ["person_id"], :name => "index_removed_notes_on_person_id"

  create_table "removed_notifications", :force => true do |t|
    t.integer  "sequence_number"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "speakers", :force => true do |t|
    t.boolean  "keynote",    :default => false
    t.integer  "person_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "event_id"
  end

  add_index "speakers", ["event_id"], :name => "index_speakers_on_event_id"
  add_index "speakers", ["person_id"], :name => "index_speakers_on_person_id"

  create_table "traded_contacts", :force => true do |t|
    t.integer  "requester_id"
    t.integer  "requested_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "traded_contacts", ["requested_id"], :name => "index_traded_contacts_on_requested_id"
  add_index "traded_contacts", ["requester_id"], :name => "index_traded_contacts_on_requester_id"

end
