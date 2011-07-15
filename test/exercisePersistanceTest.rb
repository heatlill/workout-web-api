require 'rubygems'
require 'active_record'
require 'test/unit'
require_relative '../exercise'
require_relative '../exercisePersistance'
require_relative '../databaseHelper'

class ExerciseTestCase < Test::Unit::TestCase
	include DatabaseHelper
	@@name_prefix = "test_unit_name_"
	
	def test_save_find
        name = @@name_prefix+"foo2"
		description = "bar2"
		unit_id = 456
		
        exercisePersistance = ExercisePersistance.new
		exercisePersistance.save( name, description, unit_id )

		open_connection()
		found_exercise = Exercise.find( :last )
        put found_exercise.connected?
        p found_exercise.name
		assert( 'bar2', found_exercise.description ) 
       
		close_connection()
 
	end
#	def test_create_and_find
#		open_connection()
#		Exercise.create( :name => @@name_prefix+'foo' ) do |e|
#			e.description = 'bar'
#			e.unit_id = 123
#		end	
#		exercise = Exercise.find( :first )
#		assert( 123,  exercise.unit_id ) 
#		close_connection()
#	end
	
	def teardown
#		open_connection()
#			Exercise.delete_all( "name like '" + @@name_prefix + " %'" )
#		close_connection()
	end

end
