require 'rubygems'
require 'active_record'
require 'test/unit'
require_relative '../exercise'
require_relative '../databaseHelper'

class ExerciseTestCase < Test::Unit::TestCase
	include DatabaseHelper
	@@name_prefix = "test_unit_name_"
	
	def test_save_find
        name = @@name_prefix+"foo2"
		description = "bar2"
		unit_id = 456
		
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
