Raven.configure do |config|
  config.dsn = ENV['SENTRY_DSN']
end

use Raven::Rack
