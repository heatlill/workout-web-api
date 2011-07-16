require 'rubygems'
require 'active_record'
require 'test/unit'
require_relative '../db/exercise'

class ExerciseTestCase < Test::Unit::TestCase
	def test_save_find
        name = "test exercise name"
		description = "test exercise description"
		unit_id = 999999
		
        new_exercise = Exercise.create( :name => name, :description => description, :unit_id => unit_id )

		found_exercise = Exercise.find( :last )
        #put found_exercise.connected?
        p found_exercise.name
		assert( 'bar2', found_exercise.description ) 
 
	end

    def teardown
        exercise = Exercise.find( :last )
        exercise.destroy()
    end

end
