require 'bundler/capistrano'

set :application, "kugaevsky.ru"
set :repository,  "git@github.com:kugaevsky/kugaevsky_ru.git"

set :rvm_ruby_string, "default@#{application}"
set :rvm_type, :system

require "rvm/capistrano"

set :scm, :git

set :deploy_via, :remote_cache

set :deploy_to, "/var/www/#{application}"
set :keep_releases, 5

set :user, "nick"
set :use_sudo, false

role :web, "198.199.64.150"                   # Your HTTP server, Apache/etc
role :app, "198.199.64.150"                   # This may be the same as your `Web` server
role :db,  "198.199.64.150", :primary => true # This is where Rails migrations will run


namespace :deploy do
  %w(start stop restart up down hup).each do |action|
    desc "#{action.capitalize} #{application} application server"
    task action.to_sym, roles: :app, except: { no_release: true } do
      run "sv #{action} #{application}"
    end
  end

  # This will make sure that Capistrano doesn't try to run rake:migrate (this is not a Rails project!)
  task :cold do
    deploy.update
    deploy.start
  end

  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
    end
  end
end
