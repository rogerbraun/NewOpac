set :application, "NewOpac"

set :repository,  "git@github.com:rogerbraun/NewOpac.git"
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "rokuhara.japanologie.kultur.uni-tuebingen.de"                          # Your HTTP server, Apache/etc
role :app, "rokuhara.japanologie.kultur.uni-tuebingen.de"                          # This may be the same as your `Web` server
role :db,  "rokuhara.japanologie.kultur.uni-tuebingen.de", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/Users/edv/Sites/opac2"
set :deploy_via, :remote_cache
set :user, "edv"
set :use_sudo, false

after 'deploy:update_code', 'deploy:symlink_db'

namespace :deploy do
  task :start, :roles => :app  do 
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop do ; end

  task :seed do
    run "cd #{current_path} && /usr/bin/env rake db:seed RAILS_ENV=production"
  end

  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end


  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
