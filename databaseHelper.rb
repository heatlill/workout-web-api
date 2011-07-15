require 'rubygems'
require 'active_record'
require_relative './exercise'
	
module DatabaseHelper
	ActiveRecord::Base.establish_connection(
        :adapter  => "mysql2",
        :host     => "localhost",
        :database => "test"
        #:username => "admin",
        #:password => "secret"
    )
end
