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

ActiveRecord::Schema.define(version: 2019_10_23_111627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.text "text"
    t.text "name"
    t.date "publ_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conc_words", force: :cascade do |t|
    t.text "word"
    t.text "concordance"
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

  create_table "gramm_dict_words", force: :cascade do |t|
    t.text "word"
    t.text "chars"
    t.bigint "grammar_dictionary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "conc_words", "concordances"
  add_foreign_key "concordances", "books"
  add_foreign_key "freq_voc_words", "frequency_vocabularies"
  add_foreign_key "frequency_vocabularies", "books"
  add_foreign_key "gramm_dict_words", "grammar_dictionaries"
  add_foreign_key "grammar_dictionaries", "books"
  add_foreign_key "key_words", "books"
  add_foreign_key "subj_ind_words", "subject_indices"
  add_foreign_key "subject_indices", "books"
end
