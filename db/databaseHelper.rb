require 'rubygems'
require 'active_record'
require_relative './exercise'
	
module DatabaseHelper
	ActiveRecord::Base.establish_connection(
        :adapter  => "mysql",
        :host     => "localhost",
        :database => "test"
        #:username => "admin",
        #:password => "secret"
    )
end
