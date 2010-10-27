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

ActiveRecord::Schema.define(:version => 20101026173344) do

  create_table "buches", :force => true do |t|
    t.string   "titel"
    t.string   "autor"
    t.string   "hrsg"
    t.string   "signatur"
    t.integer  "jahr"
    t.text     "kommentar"
    t.text     "anmerkungen"
    t.string   "auflage"
    t.string   "baende"
    t.string   "bearbeiter"
    t.text     "bestelladresse"
    t.string   "drehbuch"
    t.string   "format"
    t.text     "inhalt"
    t.string   "sprache"
    t.string   "literaturvorlage"
    t.string   "nebensignatur"
    t.string   "ort"
    t.string   "platz"
    t.string   "preis"
    t.string   "publikationsart"
    t.string   "reihe"
    t.string   "seiten"
    t.string   "stifter"
    t.string   "verlag"
    t.string   "standort"
    t.integer  "datensatz"
    t.date     "aufnahmedatum"
    t.string   "issn"
    t.string   "isbn"
    t.string   "invent"
    t.string   "autor_japanisch"
    t.string   "hrsg_japanisch"
    t.string   "drehbuch_japanisch"
    t.string   "reihe_japanisch"
    t.string   "titel_japanisch"
    t.string   "verlag_japanisch"
    t.string   "literaturvorlage_japanisch"
    t.string   "nacsis_japanisch"
    t.integer  "jid"
    t.string   "nacsis_url"
    t.string   "interne_notizen"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
