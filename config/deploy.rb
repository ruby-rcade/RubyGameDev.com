require 'bundler/capistrano'
require "dotenv/capistrano"
set :whenever_command, "bundle exec whenever"
require "whenever/capistrano"

# General Options

set :bundle_flags,               "--deployment"

set :application,                "rubygamedev"
set :deploy_to,                  "/home/deploy/apps/#{application}"
set :normalize_asset_timestamps, false
set :rails_env,                  "production"

set :user,         "deploy"
set :runner,       "www-data"
set :admin_runner, "www-data"
set :use_sudo, false
ssh_options[:forward_agent] = true

set :default_environment, {
  'PATH' => "~/.rbenv/shims:~/.rbenv/bin:$PATH",
}

# SCM Options
set :scm,        :git
set :repository, "git@github.com:ruby-rcade/RubyGameDev.com.git"
set :branch,     "master"

set :unicorn_config, "#{current_path}/config/unicorn.rb"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"

# Roles
role :app, '23.253.67.14'
role :web, '23.253.67.14'
role :db,  '23.253.67.14', primary: true # the host which runs migrations

after 'deploy:setup' do
  # Create Database Configuration File
  run "mkdir -p #{shared_path}/config && touch #{shared_path}/config/database.yml"
  run "mkdir -p #{shared_path}/sockets"
end

# Add Configuration Files & Compile Assets
after 'deploy:update_code' do
  # Setup Configuration
  run "cp #{shared_path}/config/database.yml #{release_path}/config/database.yml"

  # Compile Assets
  run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
end

namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && bundle exec unicorn -c #{unicorn_config} -E production -D"
  end

  task :stop, :roles => :app, :except => { :no_release => true } do 
    # run "kill `cat #{unicorn_pid}`"
    run "kill -s QUIT `cat #{unicorn_pid}`"
  end
  # task :graceful_stop, :roles => :app, :except => { :no_release => true } do
  #   run "#{try_sudo} kill -s QUIT `cat #{unicorn_pid}`"
  # end
  # task :reload, :roles => :app, :except => { :no_release => true } do
  #   run "#{try_sudo} kill -s USR2 `cat #{unicorn_pid}`"
  # end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "kill -s USR2 `cat #{unicorn_pid}`"
    # stop
    # start
  end
end

# Restart Passenger
deploy.task :restart, :roles => :app do
  # Fix Permissions
  # sudo "chown -R www-data:www-data #{current_path}"
  # sudo "chown -R www-data:www-data #{latest_release}"
  # sudo "chown -R www-data:www-data #{shared_path}/bundle"
  # sudo "chown -R www-data:www-data #{shared_path}/log"

  # Restart Application
  run "touch #{current_path}/tmp/restart.txt"
end
