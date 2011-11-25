require 'rubygems'
require 'active_record'
	
module DatabaseHelper
    DB_PARAMS = {
        :adapter  => "postgresql",
        :host     => "localhost",
        :database => "test",
        :username => "postgres",
        :password => "test"
    }
	ActiveRecord::Base.establish_connection(DB_PARAMS)
end
