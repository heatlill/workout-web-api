require 'rubygems'
require_relative 'exercise'
require_relative 'databaseHelper'

class ExercisePersistance
	include DatabaseHelper

		
	def save( name, description, unit_id )
		begin
		    open_connection()
		    exercise = Exercise.new
            exercise.name = name
            exercise.description = description
            exercise.unit_id = unit_id
		    close_connection()
		rescue StandardError => ex
		    puts ex
		end
    end


end
