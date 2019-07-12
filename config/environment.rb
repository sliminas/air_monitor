require 'bundler/setup'
require 'hanami/setup'
require_relative 'database'
require_relative '../apps/web/application'

Database.load_plugins
DB = Database.connect
Database.check_pending_migrations

Hanami.configure do
  mount Web::Application, at: '/'

  mailer do
    root 'lib/air_monitor/mailers'

    # See http://hanamirb.org/guides/mailers/delivery
    delivery :test
  end

  environment :development do
    # See: http://hanamirb.org/guides/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :debug, formatter: :json, filter: []
    assets do
      fingerprint true
    end

    # mailer do
    #   delivery :smtp, address: ENV.fetch('SMTP_HOST'), port: ENV.fetch('SMTP_PORT')
    # end
  end
end
