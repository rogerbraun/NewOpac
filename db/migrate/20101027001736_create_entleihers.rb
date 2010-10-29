class CreateEntleihers < ActiveRecord::Migration
  def self.up
    create_table :entleihers do |t|
      t.string :anschrift
      t.string :bearbeiter
      t.string :email
      t.string :heimatanschrift
      t.integer :matrikelnr
      t.string :mobiltelefon
      t.string :name
      t.string :status
      t.string :telefon
      t.string :telefon2
      t.string :ub_nr
      t.string :vermerke

      t.timestamps
    end
  end

  def self.down
    drop_table :entleihers
  end
end
