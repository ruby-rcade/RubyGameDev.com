source 'https://rubygems.org'

gem 'rails', '4.0.0'
gem 'sqlite3'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass', github: 'thomas-mcdonald/bootstrap-sass'

gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'capistrano', '~> 2.15'
group :production do
  gem 'mysql2' # If using mysql in development, this can be outside the production group.
  gem 'therubyracer'
end

group :development do
  gem 'pry'
end

gem 'omniauth'
gem 'omniauth-github'
gem 'dotenv-rails' # for managing environment variables

gem 'whenever', :require => false

# authorization
gem "pundit"

group :test do
  # gem 'rspec-rails', "2.99.0.beta1" # upgrade path apps with existing specs
  gem 'rspec-rails', "3.0.0.beta1"
  gem 'guard'
  gem 'guard-rspec'
  gem 'shoulda'
end
