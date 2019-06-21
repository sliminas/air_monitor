require 'sequel'
require 'logger'

def connect_sequel(log_file: 'log/sequel.log')
  Sequel.connect(
    adapter:         'postgres',
    host:            'localhost',
    database:        'air_monitor_development',
    user:            'rails',
    password:        'rails',
    max_connections: 10,
    logger:          Logger.new(log_file)
  )
end

def check_pending_migrations
  Sequel.extension :migration
  Sequel::Migrator.check_current(DB, 'db/migrations')
end
