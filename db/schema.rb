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

ActiveRecord::Schema.define(:version => 20130604202731) do

  create_table "cadclis", :force => true do |t|
    t.string   "nomecli"
    t.string   "status"
    t.float    "valor"
    t.date     "datavencto"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "emailcli"
    t.string   "end_c"
    t.string   "fone_c"
  end

  create_table "cadprods", :force => true do |t|
    t.string   "nomeprod"
    t.integer  "quantprod"
    t.float    "valunit"
    t.float    "total"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contatos", :force => true do |t|
    t.string   "nome_completo"
    t.string   "telefone"
    t.string   "celular"
    t.string   "grupo"
    t.date     "aniversario"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "cta_pagars", :force => true do |t|
    t.string   "descricao"
    t.string   "nomeforn"
    t.date     "datavencto"
    t.float    "valor"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "status"
    t.date     "data_pagto"
  end

  create_table "cta_recebers", :force => true do |t|
    t.string   "nomecli"
    t.string   "descr_serv"
    t.float    "valor"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "status"
    t.date     "data_recebimento"
  end

  create_table "gerapdfs", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.integer  "quant"
    t.string   "descr"
    t.float    "val_unit"
    t.float    "val_total"
    t.integer  "order_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "items", ["order_id"], :name => "index_items_on_order_id"

  create_table "menus", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "nome_cli"
    t.string   "end_cli"
    t.string   "fone_cli"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rpt_clis", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
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

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
