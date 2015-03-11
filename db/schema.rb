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

ActiveRecord::Schema.define(version: 20150223193747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dominios", force: :cascade do |t|
    t.string   "nombre"
    t.date     "fecha_de_alta"
    t.date     "vencimiento"
    t.integer  "usuario_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "dominios", ["usuario_id"], name: "index_dominios_on_usuario_id", using: :btree

  create_table "empresas", force: :cascade do |t|
    t.string   "nombre"
    t.string   "logo_name"
    t.string   "logo_uid"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "empresas", ["email"], name: "index_empresas_on_email", using: :btree

  create_table "puestos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "color"
    t.string   "letra"
    t.boolean  "esta_habilitado", default: true
    t.integer  "empresa_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "numero",           default: 0
    t.string   "estado",           default: "esperando"
    t.boolean  "es_ausente",       default: false
    t.datetime "hora_de_emision"
    t.datetime "hora_de_llamado"
    t.datetime "hora_de_atencion"
    t.datetime "hora_de_atendido"
    t.datetime "hora_de_ausente"
    t.integer  "puesto_id"
    t.integer  "empresa_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree

end
