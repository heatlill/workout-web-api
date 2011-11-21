require 'rubygems'
require 'active_record'
	
module DatabaseHelper
	ActiveRecord::Base.establish_connection(
        :adapter  => "mysql2",
        :host     => "localhost",
        :database => "test",
        :username => "mysql"
        #:password => "secret"
    )
end
