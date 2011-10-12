require 'rubygems'
require 'active_record'
require 'test/unit'
require_relative '../db/exercise'

class ExerciseTest < Test::Unit::TestCase
	def test_save_find
        name = "test exercise name"
		description = "test exercise description"

        unit_name = "test unit name from exercise_test.rb"
        unit_description = "test unit description from exercise_test.rb"
		
        Exercise.transaction do
            test_unit = ExerciseUnit.create( :name => unit_name, :description => unit_description )
            Exercise.create( :name => name, :description => description, :unit_id => test_unit.id )

            @exercise = Exercise.find( :first, :conditions => [ "name = ?", name ] )
        
            assert_equal( unit_id, @exercise.unit_id )
            assert_equal( name, @exercise.name )
            assert_equal( description, @exercise.description ) 
        end
 
	end

    def teardown
        Exercise.delete( @exercise.id )
    end

end
