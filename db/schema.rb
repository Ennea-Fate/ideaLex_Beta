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

ActiveRecord::Schema.define(version: 2019_12_11_150400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "authors", force: :cascade do |t|
    t.string "f_name"
    t.string "s_name"
    t.string "l_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.text "text"
    t.text "name"
    t.date "publ_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conc_words", force: :cascade do |t|
    t.text "word"
    t.text "content"
    t.text "pages"
    t.bigint "concordance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["concordance_id"], name: "index_conc_words_on_concordance_id"
  end

  create_table "concordances", force: :cascade do |t|
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_concordances_on_book_id"
  end

  create_table "edits", force: :cascade do |t|
    t.text "edit"
    t.bigint "unanimou_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unanimou_id"], name: "index_edits_on_unanimou_id"
    t.index ["user_id"], name: "index_edits_on_user_id"
  end

  create_table "freq_voc_words", force: :cascade do |t|
    t.text "word"
    t.integer "occurrence_rate"
    t.bigint "frequency_vocabulary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["frequency_vocabulary_id"], name: "index_freq_voc_words_on_frequency_vocabulary_id"
  end

  create_table "frequency_vocabularies", force: :cascade do |t|
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_frequency_vocabularies_on_book_id"
  end

  create_table "gramm_dict_word_forms", force: :cascade do |t|
    t.string "word"
    t.text "chars"
    t.integer "entries"
    t.bigint "gramm_dict_word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gramm_dict_word_id"], name: "index_gramm_dict_word_forms_on_gramm_dict_word_id"
  end

  create_table "gramm_dict_words", force: :cascade do |t|
    t.text "word"
    t.text "chars"
    t.bigint "grammar_dictionary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "entries"
    t.integer "sum_entries"
    t.index ["grammar_dictionary_id"], name: "index_gramm_dict_words_on_grammar_dictionary_id"
  end

  create_table "grammar_dictionaries", force: :cascade do |t|
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_grammar_dictionaries_on_book_id"
  end

  create_table "key_words", force: :cascade do |t|
    t.text "word"
    t.text "description"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_key_words_on_book_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "desc"
    t.text "text"
    t.integer "group"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.string "perm_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subj_ind_words", force: :cascade do |t|
    t.text "word"
    t.text "pages"
    t.bigint "subject_index_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_index_id"], name: "index_subj_ind_words_on_subject_index_id"
  end

  create_table "subject_indices", force: :cascade do |t|
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_subject_indices_on_book_id"
  end

  create_table "unanimous", force: :cascade do |t|
    t.string "word"
    t.string "pos"
    t.text "chars"
    t.text "desc"
    t.boolean "approves"
    t.bigint "author_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_unanimous_on_author_id"
    t.index ["user_id"], name: "index_unanimous_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "f_name"
    t.string "s_name"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "conc_words", "concordances"
  add_foreign_key "concordances", "books"
  add_foreign_key "edits", "unanimous"
  add_foreign_key "edits", "users"
  add_foreign_key "freq_voc_words", "frequency_vocabularies"
  add_foreign_key "frequency_vocabularies", "books"
  add_foreign_key "gramm_dict_word_forms", "gramm_dict_words"
  add_foreign_key "gramm_dict_words", "grammar_dictionaries"
  add_foreign_key "grammar_dictionaries", "books"
  add_foreign_key "key_words", "books"
  add_foreign_key "notes", "users"
  add_foreign_key "subj_ind_words", "subject_indices"
  add_foreign_key "subject_indices", "books"
  add_foreign_key "unanimous", "authors"
  add_foreign_key "unanimous", "users"
  add_foreign_key "users", "roles"
end
