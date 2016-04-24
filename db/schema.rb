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

ActiveRecord::Schema.define(version: 20160423221818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: true do |t|
    t.integer  "actionable_id"
    t.string   "actionable_type"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "time"
    t.string   "kind"
    t.string   "url"
    t.boolean  "checked",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contract_tenants", force: true do |t|
    t.integer  "user_id"
    t.integer  "contract_id"
    t.boolean  "signed_agreement", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contracts", force: true do |t|
    t.integer  "property_id"
    t.integer  "head_tenant_id"
    t.date     "start_date"
    t.date     "end_date"
    t.date     "break_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "offer_id"
    t.boolean  "tenant_signed"
    t.boolean  "landlord_signed"
    t.boolean  "paid_remaining_balance"
    t.boolean  "feedback_from_tenant"
    t.boolean  "direct_debit_setup"
    t.boolean  "inventory_sent"
    t.boolean  "inventory_approved"
    t.boolean  "keys_confirmed"
    t.string   "account_number"
    t.string   "sort_code"
    t.boolean  "inventory_lock"
    t.boolean  "feedback_from_landlord"
    t.boolean  "bank_details"
    t.boolean  "confirm_deposit"
    t.datetime "inventory_sent_at"
    t.string   "agreement"
    t.string   "envelope_id"
    t.datetime "agreement_ready_at"
  end

  create_table "conversations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "offer_id"
    t.integer  "property_id"
    t.boolean  "with_landlord", default: false, null: false
    t.boolean  "enabled",       default: true,  null: false
  end

  create_table "credit_cards", force: true do |t|
    t.integer  "user_id"
    t.string   "payment_processor"
    t.string   "customer_id"
    t.boolean  "livemode"
    t.string   "last_four"
    t.string   "postcode"
    t.string   "name_on_card"
    t.integer  "expiry_month"
    t.integer  "expiry_year"
    t.boolean  "default"
    t.string   "stripe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features", force: true do |t|
    t.string   "name"
    t.string   "feature_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "property_ids"
  end

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "inventory_features", force: true do |t|
    t.string   "name"
    t.string   "condition"
    t.text     "description"
    t.string   "image"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.text     "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.string   "file"
  end

  create_table "offer_references", force: true do |t|
    t.integer "offer_id"
    t.integer "user_id"
    t.string  "state"
    t.text    "reject_message"
  end

  add_index "offer_references", ["offer_id"], name: "index_offer_references_on_offer_id", using: :btree

  create_table "offers", force: true do |t|
    t.integer  "term_months"
    t.integer  "break_months"
    t.integer  "head_tenant_id"
    t.integer  "property_id"
    t.string   "state"
    t.integer  "counter_offer_to_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "move_in_date"
    t.boolean  "from_landlord"
    t.integer  "price_pcm_pence"
    t.string   "references_state"
    t.integer  "counter"
    t.text     "reject_message"
    t.string   "reject_reason"
    t.boolean  "check1",                   default: false
    t.boolean  "check2",                   default: false
    t.boolean  "check3",                   default: false
    t.integer  "contract_id"
    t.text     "additional_requests"
    t.datetime "reservation_fee_charged"
    t.datetime "accepted_at"
    t.text     "head_tenant_bio"
    t.text     "head_tenant_linkedin_url"
  end

  create_table "payments", force: true do |t|
    t.integer  "amount"
    t.string   "currency"
    t.string   "addon_names"
    t.string   "charge_id"
    t.integer  "credit_card_id"
    t.integer  "paying_user_id"
    t.integer  "property_id"
    t.string   "payment_processor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "offer_id"
  end

  create_table "properties", force: true do |t|
    t.string   "property_type",                limit: 20
    t.integer  "number_of_rooms"
    t.integer  "managed_by_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "town",                         limit: 60
    t.string   "postcode",                     limit: 9
    t.string   "address_line1",                limit: 100
    t.string   "address_line2",                limit: 100
    t.integer  "floor"
    t.date     "availability_date"
    t.integer  "term_months"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "price_pcm_pence"
    t.integer  "deposit_pence"
    t.string   "title"
    t.text     "description"
    t.string   "epc_rating",                   limit: 1
    t.string   "floor_plan"
    t.string   "gas_safety"
    t.boolean  "active"
    t.datetime "active_date"
    t.integer  "number_of_bathrooms"
    t.integer  "number_of_living_rooms"
    t.string   "furnish_status",               limit: 20
    t.integer  "feature_ids"
    t.boolean  "not_started"
    t.integer  "schedule_id"
    t.boolean  "professional_photo"
    t.boolean  "professional_floor_plan"
    t.boolean  "professional_gas_safety"
    t.boolean  "pets"
    t.boolean  "smoking"
    t.boolean  "premium"
    t.boolean  "term_months_6"
    t.boolean  "term_months_12"
    t.boolean  "term_months_18"
    t.boolean  "term_months_24"
    t.boolean  "price_includes_bills"
    t.integer  "number_of_ensuites"
    t.text     "extra_details"
    t.boolean  "zoopla"
    t.boolean  "rightmove"
    t.string   "meter_reading"
    t.boolean  "professional_epc_rating"
    t.boolean  "professional_photo_paid"
    t.boolean  "professional_floor_plan_paid"
    t.boolean  "professional_gas_safety_paid"
    t.boolean  "premium_paid"
    t.boolean  "zoopla_paid"
    t.boolean  "rightmove_paid"
    t.boolean  "professional_epc_rating_paid"
    t.string   "state",                        limit: 50
    t.string   "draft_session_id"
    t.boolean  "draft",                                    default: false, null: false
    t.string   "epc_certificate_url"
    t.string   "district",                     limit: 60
    t.string   "postcode_outward",             limit: 4
    t.string   "slug"
  end

  add_index "properties", ["slug"], name: "index_properties_on_slug", using: :btree

  create_table "property_features", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "property_id"
    t.integer  "feature_id"
    t.integer  "property_search_id"
  end

  create_table "property_images", force: true do |t|
    t.string   "image"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "property_id"
  end

  create_table "property_searches", force: true do |t|
    t.string   "location"
    t.float    "time_to_location"
    t.string   "transport_method"
    t.integer  "min_bedrooms"
    t.integer  "max_bedrooms"
    t.string   "property_type"
    t.string   "price_type"
    t.integer  "price_min"
    t.integer  "price_max"
    t.string   "sort_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "furnish_status"
    t.float    "latitude"
    t.float    "longitude"
    t.date     "availability"
    t.integer  "bedrooms"
  end

  create_table "read_marks", force: true do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.boolean  "seen",       default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reference_files", force: true do |t|
    t.integer  "reference_id"
    t.string   "document"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "references", force: true do |t|
    t.integer  "user_id"
    t.string   "reference_type"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "offer_reference_id"
    t.boolean  "apply_without"
  end

  add_index "references", ["user_id"], name: "index_references_on_user_id", using: :btree

  create_table "reviews", force: true do |t|
    t.text     "review"
    t.integer  "landlord_id"
    t.integer  "tenant_id"
    t.integer  "stars"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "property_id"
    t.integer  "from_user_id"
    t.integer  "user_id"
    t.string   "subject"
    t.boolean  "feedback_from_tenant"
    t.string   "source"
    t.integer  "contract_id"
  end

  create_table "rooms", force: true do |t|
    t.string   "room_type"
    t.boolean  "is_template"
    t.boolean  "double_room"
    t.integer  "parent_room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "property_id"
  end

  create_table "schedule_periods", force: true do |t|
    t.integer  "day_of_week"
    t.boolean  "deactive"
    t.integer  "schedule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "start_time_minutes"
    t.integer  "end_time_minutes"
  end

  create_table "schedules", force: true do |t|
    t.date     "start_date"
    t.boolean  "allow_open_viewings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscribers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unregistered_tenants", force: true do |t|
    t.string   "name"
    t.integer  "offer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "token"
    t.integer  "user_id"
    t.datetime "email_sent_at"
  end

  create_table "user_addresses", force: true do |t|
    t.integer  "user_id"
    t.integer  "flat_number"
    t.integer  "building_number"
    t.string   "building_name"
    t.string   "street"
    t.string   "town"
    t.string   "postcode",        limit: 10
    t.date     "move_in_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_offers", force: true do |t|
    t.integer  "user_id"
    t.integer  "offer_id"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "user_bio"
    t.string   "user_linkedin_url"
  end

  create_table "users", force: true do |t|
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image"
    t.string   "mobileno"
    t.string   "description"
    t.string   "provider"
    t.text     "full_address"
    t.string   "token"
    t.text     "bio"
    t.string   "linkedin_url"
    t.boolean  "support_user",                      default: false, null: false
    t.string   "gender"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "external_email_verified",           default: true
    t.boolean  "mobileno_verified"
    t.string   "messagebird_batch_id"
    t.string   "verification_code"
    t.datetime "verification_code_sent_at"
    t.datetime "checkout_listing_reminder_sent_at"
    t.date     "dob"
    t.string   "applicant_id"
    t.integer  "failed_attempts",                   default: 0,     null: false
    t.datetime "locked_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_conversations", force: true do |t|
    t.integer  "user_id"
    t.integer  "last_read_message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "conversation_id"
  end

  create_table "viewings", force: true do |t|
    t.integer  "property_id"
    t.integer  "tenant_id"
    t.datetime "viewing_date"
    t.string   "state"
    t.boolean  "from_landlord"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
