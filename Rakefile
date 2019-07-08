require 'rake'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
rescue LoadError
end

namespace :db do
  def db_version
    return 0 unless DB.tables.include?(:schema_info)
    DB[:schema_info].first[:version]
  end

  require 'sequel/core'
  require_relative 'config/database'
  DB = Database.connect log_file: ($stdout if Hanami.env == 'development')
  Sequel.extension :migration

  desc 'Prints current schema version'
  task :version do
    puts "Schema Version: #{db_version}"
  end

  desc 'Run migrations'
  task :migrate, [:version] do |t, args|
    version = args[:version].to_i if args[:version]

    Sequel::Migrator.run(DB, 'db/migrations', target: version)
    Rake::Task['db:schema_dump'].execute
    Rake::Task['db:version'].execute
  end

  desc 'Perform rollback to specified target or full rollback as default'
  task :rollback, :target do |t, args|
    args.with_defaults(target: [db_version - 1, 0].max)
    Sequel::Migrator.run(DB, 'db/migrations', target: args[:target].to_i)

    Rake::Task['db:schema_dump'].execute
    Rake::Task['db:version'].execute
  end

  desc 'Perform migration reset (full rollback and migration)'
  task :reset do
    Sequel::Migrator.run(DB, 'db/migrations', target: 0)
    Sequel::Migrator.run(DB, 'db/migrations')
    Rake::Task['db:schema_dump'].execute
    Rake::Task['db:version'].execute
  end

  desc 'Dump the DB schema'
  task :schema_dump, [:file, :same_db] do |task, args|
    DB.extension :schema_dumper
    args.with_defaults(file: 'db/schema.rb', same_db: true)
    File.open(args[:file], 'w') { |file| file << DB.dump_schema_migration(same_db: args[:same_db]) }
  end
end
