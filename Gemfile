source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.0'

# application server
gem 'unicorn'

# databases
gem 'sqlite3', groups: [:development, :test]
gem 'mysql2', group: :production

# assets
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass'

# authentication
gem 'omniauth'
gem 'omniauth-github'

# authorization
gem "pundit"

# configuration
gem 'dotenv-rails' # for managing environment variables
gem 'whenever', :require => false

# deployment and provisioning
gem 'sunzi'
gem 'capistrano', '~> 2.15'
# gem 'capistrano', '~> 3.0.1'
gem 'knife-solo'
gem 'berkshelf'

group :production do
  # gem 'mysql2' # If using mysql in development, this can be outside the production group.
  # gem 'pg'
  gem 'rails_12factor' # heroku
  gem 'therubyracer'
end

group :test do
  # gem 'rspec-rails', "2.99.0.beta1" # upgrade path for apps with existing specs (not us)
  gem 'rspec-rails', "3.0.0.beta1"
  # gem 'guard'
  # gem 'guard-rspec'
  gem 'shoulda'
end

# api
gem 'jbuilder', '~> 1.2'

# group :doc do
#   # bundle exec rake doc:rails generates the API under doc/api.
#   gem 'sdoc', require: false
# end

group :development do
  gem 'pry'
end
