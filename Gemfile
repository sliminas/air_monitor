source 'https://rubygems.org'

gem 'rake'
gem 'hanami', '~> 1.3'
gem 'sequel'

gem 'pg'

gem 'http'

gem 'sass'
gem 'slim'
gem 'activesupport'
gem 'representable'
gem 'multi_json'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
  gem 'pry-byebug'
end

group :test, :development do
  gem 'dotenv', '~> 2.4'
end

group :test do
  gem 'rspec'
  gem 'capybara'
end

group :production do
  # gem 'puma'
end
