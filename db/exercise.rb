require 'rubygems'
require 'active_record'
require_relative 'databaseHelper'

class Exercise < ActiveRecord::Base
    include DatabaseHelper
	set_table_name( 'exercises' )
	set_primary_key( 'id' )
end
