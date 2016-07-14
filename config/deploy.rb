# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'kugaevsky.ru'
set :repo_url, 'git@github.com:kugaevsky/kugaevsky_ru.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/#{fetch(:application)}"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/newrelic.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

set :rvm_ruby_version, "2.3.1@#{fetch(:application)}"


namespace :deploy do
  %w(start stop restart up down hup).each do |action|
    desc "#{action.capitalize} #{fetch(:application)} application server"
    on roles(:web) do
      task action.to_sym, roles: :app, except: { no_release: true } do
        run "sv #{action} #{application}"
      end
    end
  end
end
