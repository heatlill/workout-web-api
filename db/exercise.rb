require 'rubygems'
require 'active_record'
require_relative 'database_helper'

class Exercise < ActiveRecord::Base
    include DatabaseHelper
	set_table_name( 'exercises' )
	set_primary_key( 'id' )

    def to_s
        puts  "#{id} #{name} #{description} #{unit_id}"
    end
end
