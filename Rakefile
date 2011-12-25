require 'rubygems'
require 'bundler'
require 'logger'
begin
    Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
    $stderr.puts e.message
    $stderr.puts "Run `bundle install` to install missing gems"
    exit e.status_code
end

require 'rake/testtask'

Rake::TestTask.new('test') do |t|
    t.pattern = 'test/**/*test_*.rb'
    t.warning = false
end

require 'active_record'
require 'fileutils'
require_relative 'db/database_helper'
include DatabaseHelper
namespace :db do
    desc "Migrate the database."
    task(:migrate => :environment) do
        ActiveRecord::Base.logger = Logger.new(STDOUT)
        ActiveRecord::Migration.verbose = true
        ActiveRecord::Migrator.migrate("db/migrate")
    end
    desc "Reset database schema"
    task(:reset) do
        ActiveRecord::Base.logger = Logger.new(STDOUT)
        ActiveRecord::Migration.verbose = true
        ActiveRecord::Migrator.down('db/migrate')
        ActiveRecord::Migrator.migrate('db/migrate')
    end
end 
desc "Create databse migration."
task(:generate_schema) do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    File.open('db/schema_gen.rb', 'w') do |f|
        ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, f)
    end
end
desc "Load the database schema."
task(:schema) do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    `ruby db/schema_gen.rb`
end
end

task :default => [:test]
