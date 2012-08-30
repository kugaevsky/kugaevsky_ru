set :application, "kugaevsky.ru"
set :repository,  "git@bitbucket.org:kugaevsky/kugaevsky.ru.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/home/u42828/kugaevsky_releases"
set :keep_releases, 5

set :user, "u42828"
set :use_sudo, false

role :web, "u42828.ssh.masterhost.ru"                          # Your HTTP server, Apache/etc
role :app, "u42828.ssh.masterhost.ru"                          # This may be the same as your `Web` server
role :db,  "u42828.ssh.masterhost.ru", :primary => true # This is where Rails migrations will run

# Hooks
after "deploy:update", "deploy:cleanup"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end


namespace :deploy do
  task :minify, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
