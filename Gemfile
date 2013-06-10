source 'https://rubygems.org'

# rails
gem 'rails', '3.2.3'

# DB
gem 'pg'

# app things in alpha order
gem 'activeadmin'
gem 'activemerchant', :require => 'active_merchant'
gem 'carrierwave'
gem 'capistrano'
gem 'rvm-capistrano'
gem "friendly_id", "~> 4.0.1"
gem 'jquery-rails'
gem "meta_search",    '>= 1.1.0.pre'
gem "rmagick"
gem 'sass-rails'
gem 'simple_form'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platform => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem 'twitter-bootstrap-rails'
end

group :development do
	gem 'thin'
  gem 'faker'
end


group :development, :test do
  gem 'factory_girl_rails'
end

group :test do
	gem 'shoulda'
end