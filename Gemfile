source 'https://rubygems.org'
ruby '2.5.0'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Project Specific Gems
gem 'figaro', '~> 1.1', '>= 1.1.1'
gem 'mechanize', '~> 2.7', '>= 2.7.5'
gem 'sprockets', '~> 3.5', '>= 3.5.2'
gem 'watir', '~> 6.0'
gem 'redis'
gem 'sidekiq', '~> 4.1', '>= 4.1.2'
gem 'exception_handler', '~> 0.8.0.0'
gem "devise", ">= 4.6.0"
gem 'pundit', '~> 2.0'
gem 'iex-ruby-client', '~> 0.4.4'
gem 'scenic', '~> 1.4'

gem 'groupdate', '~> 2.5'

gem 'pghero', '~> 1.7'
gem 'newrelic_rpm', '~> 3.16', '>= 3.16.0.318'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'bullet', '~> 5.8', '>= 5.8.1'
end

group :test do
 gem 'guard', '~> 2.14'
 gem 'guard-minitest', '~> 2.4', '>= 2.4.6'
 gem 'terminal-notifier', '~> 2.0'
 gem 'terminal-notifier-guard', '~> 1.7'
 gem 'vcr', '~> 4.0'
 gem 'webmock', '~> 3.3'
 gem 'test-prof', '~> 0.6.0'
 gem 'simplecov', '~> 0.12.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
