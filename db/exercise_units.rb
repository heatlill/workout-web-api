require 'rubygems'
require 'active_record'
rquire_relative 'databaseHelper'

class ExerciseUnits < ActiveRecord::Base
    include DatabaseHelper
    set_table_name( 'exercise_units' )
    set_primary_key( 'id ')

end
