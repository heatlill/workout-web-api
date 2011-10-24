require 'rubygems'
require 'active_record'
require_relative 'database_helper'

class Exercise < ActiveRecord::Base
    include DatabaseHelper
	set_table_name( 'exercise' )
	set_primary_key( 'id' )

    def to_s
        puts  "#{id} #{name} #{description} #{exercise_unit_id}"
    end
end
