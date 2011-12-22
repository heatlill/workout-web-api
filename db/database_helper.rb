require 'rubygems'
require 'active_record'
	
module DatabaseHelper
    database_url = ENV['database_url'] 
    database_url |= 'test'
    DB_PARAMS = {
        :adapter  => "postgresql",
        :host     => "localhost",
        :database => "test",
        :username => "postgres",
        :password => "test"
    }
	ActiveRecord::Base.establish_connection(DB_PARAMS)
end
