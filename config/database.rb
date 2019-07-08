require 'sequel'
require 'logger'

class Database

  class << self

    def connect(log_file: 'log/sequel.log')
      connection = ENV['DATABASE_URL'] ||
        'postgres://rails:rails@localhost/air_monitor_development'

      Sequel.connect(connection, max_connections: 10, logger: Logger.new(log_file))
    end

    def check_pending_migrations
      Sequel.extension :migration
      Sequel::Migrator.check_current(DB, 'db/migrations')
    end

    def load_plugins
      Sequel::Model.plugin :timestamps, update_on_create: true
    end

  end

end
