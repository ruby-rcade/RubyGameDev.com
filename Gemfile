source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '~> 4.2.0'

# application server
gem 'puma'

# databases
gem 'sqlite3', groups: [:development, :test]

# For use with letsencrypt-rails-heroku gem.
# Until the new API calls are generally available, you must manually specify this fork of the Heroku API gem:
gem 'platform-api', git: 'https://github.com/jalada/platform-api', branch: 'master'

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'therubyracer' # for asset compilation
  gem 'postmark-rails' # sending email
  gem 'letsencrypt-rails-heroku'
end

# assets
gem 'sprockets-rails', '>= 2.1.4'
gem 'quiet_assets', group: :development
gem 'sass-rails', '~> 5.0.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks'
# gem 'bootstrap-sass', '~> 3.3'
gem 'bootstrap-sass', '= 3.3.4.1'

# authentication
gem 'omniauth'
gem 'omniauth-github'
gem 'clearance'

# social
gem 'twitter' # used for posting updates

# authorization
gem 'pundit'

# configuration
gem 'dotenv-rails' # for managing environment variables
gem 'whenever', :require => false # for managing crontab

# monitoring/reporting
gem 'newrelic_rpm'
gem 'bugsnag'

# markdown processing
gem 'redcarpet'

# API stackoverflow
gem 'ruby-stackoverflow', git: 'https://github.com/PowerCodeGirls/ruby-stackoverflow.git'

gem 'sidekiq'
gem "sidekiq-cron", "~> 0.3.0"
gem 'rails-i18n', '~> 4.0.0'
gem 'sinatra', :require => nil

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails', '~> 4.4.0'
  gem 'capybara'
  # gem 'webmock'
  gem 'codeclimate-test-reporter', require: false
  gem 'webmock', '~> 1.14'
  gem 'database_cleaner'
end

# api
gem 'jbuilder', '~> 1.2'

group :development, :test do
  gem 'launchy'
  gem 'guard'
  gem 'guard-rspec'
  gem 'pry-nav'
  gem 'pry-remote'
  gem 'terminal-notifier-guard'
  gem 'vcr','~> 2.7'
end
