namespace :db do
  task :import_users => :environment do
    DB = Sequel.connect(ENV["USER_DATABASE"])
    users = DB[:ausleihers]
    users.each do |user|
      user.delete(:email2)
      user[:updated_at] = user[:aenderungsdatum]
      user.delete(:aenderungsdatum)
      #sollte wohl nicht gelöscht werden, aber erstmal ok
      user.delete(:fachkombi)
      Entleiher.create(user)
    end
  end
end
