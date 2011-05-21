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

ActiveRecord::Schema.define(:version => 20110520135149) do

  create_table "admins", :force => true do |t|
    t.string   "login"
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "number",                         :default => 0
    t.string   "description",     :limit => 100
    t.integer  "status_cd",                      :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ad_file_name"
    t.integer  "ad_file_size"
    t.string   "ad_type_content"
    t.datetime "ad_updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "title",                             :null => false
    t.string   "auther",                            :null => false
    t.integer  "area_id",                           :null => false
    t.integer  "company_id",                        :null => false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.integer  "pv",                 :default => 0
    t.integer  "status",             :default => 0
    t.text     "summary"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["area_id"], :name => "index_articles_on_area_id"
  add_index "articles", ["company_id"], :name => "index_articles_on_company_id"

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                                 :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 25
    t.string   "guid",              :limit => 10
    t.integer  "locale",            :limit => 1,  :default => 0
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["admin_id"], :name => "fk_admin"
  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "fk_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_assetable_type"

  create_table "companies", :force => true do |t|
    t.string   "name",               :null => false
    t.string   "tel",                :null => false
    t.string   "qq"
    t.string   "msn"
    t.string   "address",            :null => false
    t.string   "linkman",            :null => false
    t.text     "summary"
    t.text     "body",               :null => false
    t.string   "cover_file_name"
    t.integer  "cover_file_size"
    t.string   "cover_content_type"
    t.datetime "cover_updated_at"
    t.string   "web_site"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", :force => true do |t|
    t.string   "title",                             :null => false
    t.integer  "area_id",                           :null => false
    t.integer  "company_id",                        :null => false
    t.text     "summary",                           :null => false
    t.text     "journey",                           :null => false
    t.text     "indemnify"
    t.text     "notice"
    t.string   "city"
    t.string   "start_date"
    t.integer  "pcount",             :default => 0
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "routes", ["area_id"], :name => "index_routes_on_area_id"
  add_index "routes", ["company_id"], :name => "index_routes_on_company_id"

  create_table "settings", :force => true do |t|
    t.string   "var",                      :null => false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], :name => "index_settings_on_thing_type_and_thing_id_and_var", :unique => true

  create_table "topics", :force => true do |t|
    t.string   "title",                             :null => false
    t.integer  "area_id",                           :null => false
    t.integer  "company_id",                        :null => false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.integer  "pv",                 :default => 0
    t.integer  "rec_num",            :default => 0
    t.integer  "pop_num",            :default => 0
    t.text     "summary"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topics", ["area_id"], :name => "index_topics_on_area_id"
  add_index "topics", ["company_id"], :name => "index_topics_on_company_id"

end
