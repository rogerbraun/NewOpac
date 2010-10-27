# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require "yaml"

examples = YAML.load_file "db/books_small.yaml"

examples.each_with_index do |book,i|

  book_g = {:isbn => book["isbn"], :titel => book["titel"], :titel_japanisch => book["titel_sj"], :autor => book["autor"], :autor_japanisch => book["autor_sj"], :signatur => book["Signatur"], :jahr => book["Jahr"], :kommentar => book["Kommentar"],:anmerkungen => book["anmerkungen"], :auflage => book[:auflage], :baende => book["bde"], :bearbeiter => book["bearb"], :bestelladresse => book[:bestelladresse], :drehbuch => book["drehbuch"], :format => book[:format], :sprache => book["sprache"], :literaturvorlage => book["literaturvorlage"], :nebensignatur => book["nebensignatur"], :publikationsart => book["publikationsart"], :reihe => book["reihe"], :seiten => book["seiten"], :stifter => book["stifter"], :verlag => book["verlag"], :standort => book["standort"], :datensatz => book["datensatz"], :issn => book["issn"], :invent => book["invent"], :inhalt => book["inhalt"], :hrsg => book["Hrsg"], :hrsg_japanisch => book["Hrsg_sj"], :drehbuch_japanisch => book["drehbuch_sj"], :reihe_japanisch => book["reihe_sj"], :verlag_japanisch => book["verlag_sj"], :literaturvorlage_japanisch => book["litvor_jp"], :nacsis_japanisch => book["nacsis_jp"], :jid => book["jid"], :nacsis_url => book["nacsis_url"], :interne_notizen => book["interne_notizen"] }


  if b = Buch.create(book_g) then
    puts "#{i} saved"
  else
    puts "NOT saved"
  end
end
  
