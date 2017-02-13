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

ActiveRecord::Schema.define(version: 20151007055936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.string   "code"
    t.string   "category"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "deal_type"
  end

  create_table "categories_offers", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "offer_id"
  end

  create_table "charities", force: :cascade do |t|
    t.string   "name"
    t.string   "web"
    t.integer  "region_id"
    t.string   "address"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zip"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_uid"
    t.string   "charity_type"
    t.string   "subdomain"
    t.string   "use_funds"
    t.string   "logo_uid"
    t.string   "photo_uid"
    t.boolean  "active",       default: true
    t.integer  "order"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "charity_photos", force: :cascade do |t|
    t.integer  "charity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_uid"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0
    t.integer  "attempts",   default: 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "experience_taggables", force: :cascade do |t|
    t.integer  "experience_tag_id"
    t.integer  "venue_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "experience_tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "external_uids", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follow_up_notes", force: :cascade do |t|
    t.integer  "charity_id"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["charity_id"], name: "index_follow_up_notes_on_charity_id", using: :btree
  end

  create_table "follow_up_notes_users", id: false, force: :cascade do |t|
    t.integer "follow_up_note_id"
    t.integer "user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string   "group_name"
    t.integer  "group_size"
    t.string   "code"
    t.datetime "time"
    t.string   "perk"
    t.decimal  "amount"
    t.string   "venue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "long_tasks", force: :cascade do |t|
  end

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.string   "mobile_image_uid"
    t.string   "website_image_uid"
    t.string   "mobile_url"
    t.string   "website_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
  end

  create_table "notification_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: :cascade do |t|
    t.text     "content"
    t.string   "ticker"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "venue_id"
    t.string   "name"
    t.text     "details"
    t.integer  "min_diners"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "available"
    t.integer  "total"
    t.float    "price"
    t.float    "original_price"
    t.string   "times"
  end

  create_table "open_times", force: :cascade do |t|
    t.integer  "openable_id"
    t.string   "openable_type"
    t.integer  "start"
    t.integer  "end"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_notifications", force: :cascade do |t|
    t.string   "status"
    t.string   "address_city"
    t.string   "address_name"
    t.string   "address_state"
    t.string   "address_street"
    t.string   "address_zip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "invoice"
    t.string   "mc_currency"
    t.string   "mc_gross"
    t.string   "payer_email"
    t.string   "payer_status"
    t.string   "payment_type"
    t.string   "verify_sign"
    t.integer  "txn_id"
    t.integer  "transaction_id"
    t.integer  "paypal_id"
    t.integer  "user_id"
    t.text     "parameters"
    t.datetime "payment_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "user_id"
    t.float    "amount"
    t.string   "stripe_charge_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "offer_id"
    t.string   "code"
    t.integer  "num_diners"
    t.string   "occasion"
    t.boolean  "confirmed"
    t.datetime "time_confirmed"
    t.string   "coupon"
    t.string   "name"
    t.string   "phone"
    t.boolean  "called"
    t.string   "state"
    t.string   "paypal_charge_token"
    t.integer  "charity_id"
    t.string   "friend"
    t.index ["user_id"], name: "index_payments_on_user_id", using: :btree
  end

  create_table "postcards", force: :cascade do |t|
    t.string   "city",                            null: false
    t.string   "state",                           null: false
    t.string   "user_name",                       null: false
    t.string   "restaurant_name",                 null: false
    t.text     "message",                         null: false
    t.boolean  "sent",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", force: :cascade do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.bigint   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "remind_lists", force: :cascade do |t|
    t.string   "phone"
    t.string   "email"
    t.string   "blah"
    t.datetime "last_reminded"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "venue_id"
    t.integer  "offer_id"
    t.integer  "charity_id"
    t.integer  "num_diners"
    t.string   "occasion"
    t.boolean  "confirmed"
    t.datetime "time_confirmed"
    t.string   "coupon"
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "called",         default: false
    t.string   "state"
    t.float    "amount"
    t.string   "code"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "author_name"
    t.text     "content"
    t.integer  "rating"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "time"
    t.index ["venue_id"], name: "index_reviews_on_venue_id", using: :btree
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", using: :btree
    t.index ["updated_at"], name: "index_sessions_on_updated_at", using: :btree
  end

  create_table "social_links", force: :cascade do |t|
    t.integer  "venue_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "socialbutterflies", force: :cascade do |t|
    t.string   "facebook"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_zones", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_badges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "badge_id"
    t.boolean  "sent_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["badge_id"], name: "index_user_badges_on_badge_id", using: :btree
    t.index ["user_id"], name: "index_user_badges_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "phone"
    t.boolean  "admin",                  default: false
    t.string   "provider"
    t.string   "twitter_uid"
    t.string   "city"
    t.integer  "zip"
    t.string   "gender"
    t.datetime "birthday"
    t.string   "stripe_customer_token"
    t.string   "authentication_token"
    t.string   "twitter_secret"
    t.string   "twitter_token"
    t.string   "facebook_secret"
    t.string   "facebook_token"
    t.boolean  "has_twitter",            default: false,      null: false
    t.boolean  "has_facebook",           default: false,      null: false
    t.text     "friends",                default: "--- []\n", null: false
    t.string   "facebook_uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "venue_taggables", force: :cascade do |t|
    t.integer  "venue_tag_id"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venue_tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "description"
    t.string   "address"
    t.string   "city"
    t.integer  "state_id"
    t.string   "zip"
    t.string   "neighborhood"
    t.string   "web"
    t.integer  "price"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "main_image_uid"
    t.string   "phone"
    t.string   "restaurant_tile_image_uid"
    t.integer  "time_zone_id"
    t.float    "rating"
    t.string   "reference"
    t.boolean  "active",                    default: true
    t.string   "voucher",                   default: "5"
    t.decimal  "multiplier",                default: "1.5"
    t.string   "feemessage",                default: "Enter fee mesage."
    t.decimal  "feecharge",                 default: "0.0"
    t.boolean  "apply_able",                default: false
    t.string   "email",                     default: "venue@example.com"
    t.string   "slug"
    t.integer  "vouchers_available",        default: 0
    t.integer  "vouchers_total",            default: 0
    t.string   "outside_image_uid"
    t.string   "timeline_image_uid"
    t.string   "google_maps_url"
    t.string   "times"
    t.string   "device_id"
    t.boolean  "visible",                   default: true
    t.string   "first_name"
    t.string   "last_name"
    t.text     "cc_num"
    t.string   "cc_expm"
    t.string   "cc_expy"
    t.string   "cc_cvv2"
    t.string   "cc_zip"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "social_media_email"
    t.index ["slug"], name: "index_venues_on_slug", unique: true, using: :btree
  end

  create_table "vouchers", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "total"
    t.integer  "available"
    t.integer  "offer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["offer_id"], name: "index_vouchers_on_offer_id", using: :btree
  end

end
