class Hash
  def rename(oldkey, newkey)
    self[newkey] = self[oldkey]
    self.delete(oldkey)
  end
end

namespace :db do
  task :import_books=> :environment do
    DB = Sequel.connect(ENV["USER_DATABASE"])
    books = DB[:buch]
    books.each do |book|

      book.rename(:ID,:id)
      book.rename(:Hrsg,:hrsg)
      book.rename(:Signatur, :signatur)
      book.rename(:Jahr, :jahr)
      book.rename(:Kommentar, :kommentar)
      book.rename(:bde, :baende)
      book.rename(:bearb, :bearbeiter)
      book.rename(:autor_sj, :autor_japanisch)
      book.rename(:Hrsg_sj, :hrsg_japanisch)
      book.rename(:titel_sj, :titel_japanisch)
      book.rename(:drehbuch_sj, :drehbuch_japanisch)
      book.rename(:reihe_sj, :reihe_japanisch)
      book.rename(:verlag_sj, :verlag_japanisch)
      book.rename(:litvor_sj, :literaturvorlage_japanisch)
      book.rename(:nacsis_sj, :nacsis_japanisch)
      book.rename(:internenotizen, :interne_notizen)

      # Komplexeres

      book.delete(:datum)
      entleiher = book.delete(:entleiher)
      leihende = book.delete(:leihende)
      aenderungsdatum = book.delete(:aenderungsdatum)
      book.delete(:dump)
      book.delete(:Vormerken)
      book.delete(:mahnung)
      book.delete(:verlaengerung)

      u = nil
      d = nil
      unless (entleiher || "").strip.empty?
        u = Entleiher.where(:name => entleiher).first
        if u 
          puts "Found #{u.name}" 
          begin
            d = Date.strptime(leihende, "%m/%d/%Y")
          rescue => e
            puts e
            puts leihende
            d = DateTime.now + 4.weeks
          end
      
        else
          puts "Could not find #{entleiher}"
        end
      end

      b = Buch.new(book)
      unless b.save(false)
        puts b.errors
        puts b.isbn
      end
      if u
        l = Lending.new
        l.returned = false
        l.entleiher = u
        l.buch = b
        l.leihende = d
        unless l.save
          puts l.errors
        end
      end
    end
  end
end
