set :application, "kugaevsky.ru"
set :repository,  "git@bitbucket.org:kugaevsky/kugaevsky.ru.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/home/u42828/kugaevsky_releases"
set :keep_releases, 5

set :user, "u42828"
set :use_sudo, false

role :web, "u42828.ssh.masterhost.ru"                   # Your HTTP server, Apache/etc
role :app, "u42828.ssh.masterhost.ru"                   # This may be the same as your `Web` server
role :db,  "u42828.ssh.masterhost.ru", :primary => true # This is where Rails migrations will run

# Hooks
after "deploy:update", "deploy:cleanup"

