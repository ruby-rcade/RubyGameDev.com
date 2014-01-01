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

# Roles
role :app, '23.253.67.14'
role :db,  '23.253.67.14', primary: true # which host to run migrations on

after 'deploy:setup' do
  # Create Database Configuration File
  run "mkdir -p touch #{shared_path}/config && touch #{shared_path}/config/database.yml"
end

# Add Configuration Files & Compile Assets
after 'deploy:update_code' do
  # Setup Configuration
  run "cp #{shared_path}/config/database.yml #{release_path}/config/database.yml"

  # Compile Assets
  run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
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
