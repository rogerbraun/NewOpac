class CreateBuches < ActiveRecord::Migration
  def self.up
    create_table :buches do |t|
      t.string :titel
      t.string :autor
      t.string :hrsg
      t.string :signatur
      t.integer :jahr
      t.text :kommentar
      t.text :anmerkungen
      t.string :auflage
      t.string :baende
      t.string :bearbeiter
      t.text :bestelladresse
      t.string :drehbuch
      t.string :format
      t.text :inhalt
      t.string :sprache
      t.string :literaturvorlage
      t.string :nebensignatatur
      t.string :ort
      t.string :platz
      t.string :preis
      t.string :publikationsart
      t.string :reihe
      t.string :seiten
      t.string :stifter
      t.string :verlag
      t.string :standort
      t.integer :datensatz
      t.date :aufnahmedatum
      t.string :issn
      t.string :svb
      t.string :invent
      t.string :autor_japanisch
      t.string :hrsg_japanisch
      t.string :drehbuch_japanisch
      t.string :reihe_japanisch
      t.string :titel_japanisch
      t.string :verlag_japanisch
      t.string :literaturvorlage_japanisch
      t.text :nacsis_japanisch
      t.integer :jid
      t.string :nacsis_url
      t.string :interne_notizen

      t.timestamps
    end
  end

  def self.down
    drop_table :buches
  end
end
