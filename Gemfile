
source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.1.4"
# The modern asset pipeline for Rails
gem "propshaft"
# SQLite for development and test
gem "sqlite3", ">= 2.1"
# PostgreSQL for production
gem "pg", "~> 1.5"
# Use the Puma web server
gem "puma", ">= 5.0"
# Use JavaScript with ESM import maps
gem "importmap-rails"
# Hotwire
gem "turbo-rails"
gem "stimulus-rails"
# Build JSON APIs
gem "jbuilder"

# Use Active Model has_secure_password
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Database-backed adapters
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Reduces boot times through caching
gem "bootsnap", require: false

# Deploy as a Docker container
gem "kamal", require: false

# HTTP asset caching/compression
gem "thruster", require: false

# Active Storage variants
gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "bundler-audit", require: false
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
