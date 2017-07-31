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

ActiveRecord::Schema.define(version: 20170720213606) do

  create_table "algorithms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "DOI"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classifications", force: :cascade do |t|
    t.string "name"
    t.integer "algorithm_id"
    t.integer "preprocessing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["algorithm_id"], name: "index_classifications_on_algorithm_id"
    t.index ["preprocessing_id"], name: "index_classifications_on_preprocessing_id"
  end

  create_table "cluster_documents", force: :cascade do |t|
    t.integer "cluster_id"
    t.integer "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cluster_id"], name: "index_cluster_documents_on_cluster_id"
    t.index ["document_id"], name: "index_cluster_documents_on_document_id"
  end

  create_table "clusters", force: :cascade do |t|
    t.string "name"
    t.integer "classification_id"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classification_id"], name: "index_clusters_on_classification_id"
  end

  create_table "corpora", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "corpus_file"
  end

  create_table "documents", force: :cascade do |t|
    t.text "title"
    t.integer "year"
    t.string "category"
    t.text "content"
    t.integer "preprocessing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preprocessing_id"], name: "index_documents_on_preprocessing_id"
  end

  create_table "parameters", force: :cascade do |t|
    t.string "name"
    t.string "typeof"
    t.integer "algorithm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["algorithm_id"], name: "index_parameters_on_algorithm_id"
  end

  create_table "preprocessings", force: :cascade do |t|
    t.integer "corpus_id"
    t.integer "algorithm_id"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["algorithm_id"], name: "index_preprocessings_on_algorithm_id"
    t.index ["corpus_id"], name: "index_preprocessings_on_corpus_id"
  end

  create_table "valued_cla_parameters", force: :cascade do |t|
    t.string "value"
    t.integer "parameter_id"
    t.integer "classification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classification_id"], name: "index_valued_cla_parameters_on_classification_id"
    t.index ["parameter_id"], name: "index_valued_cla_parameters_on_parameter_id"
  end

  create_table "valued_pre_parameters", force: :cascade do |t|
    t.string "value"
    t.integer "parameter_id"
    t.integer "preprocessing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parameter_id"], name: "index_valued_pre_parameters_on_parameter_id"
    t.index ["preprocessing_id"], name: "index_valued_pre_parameters_on_preprocessing_id"
  end

  create_table "words", force: :cascade do |t|
    t.string "content"
    t.integer "cluster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cluster_id"], name: "index_words_on_cluster_id"
  end

end
