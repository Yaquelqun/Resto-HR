source "https://rubygems.org"

ruby "3.4.2"
gem "rails", "~> 8.0.1"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "devise"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "jbuilder"
gem 'slim-rails'
gem 'simple_form'
gem "redis", ">= 4.0.1"
gem "faker" # In production because i wanna use it to generate readable identifiers
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem "byebug"
  gem "rspec-rails"
  gem 'rails-controller-testing'
  gem 'factory_bot_rails'
end

group :development do
  gem "web-console"
  gem "hotwire-livereload"
end

