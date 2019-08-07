require 'sequel'
require 'logger'

class Database

  class << self

    def connect(log_file: nil)
      log_file ||= 'log/sequel.log'
      if log_file.is_a?(String)
        log_dir = log_file.split('/')[0..-2].join('/')
        FileUtils.mkdir(log_dir) unless File.exist?(log_dir)
      end

      connection = ENV['DATABASE_URL'] ||
        'postgres://rails:rails@localhost/air_monitor_development'

      Sequel.connect(connection, max_connections: ENV['RAILS_MAX_THREADS'] || 5, logger: Logger.new(log_file))
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
