source 'http://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.18'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'pg'
  #  gem 'sqlite3'
  gem 'debugger'
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'rspec-rails'
  gem 'ZenTest'
  gem 'launchy'
  gem 'rest-open-uri'
end


group :production do
#  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer'              
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'
gem 'haml'

gem 'ruby-tmdb3'
# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

#group :test, :development do
#end
