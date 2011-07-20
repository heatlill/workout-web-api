require 'rubygems'
require 'active_record'
	
module DatabaseHelper
	ActiveRecord::Base.establish_connection(
        :adapter  => "mysql",
        :host     => "localhost",
        :database => "test"
        #:username => "admin",
        #:password => "secret"
    )
end
