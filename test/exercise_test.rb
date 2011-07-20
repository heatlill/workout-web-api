require 'rubygems'
require 'active_record'
require 'test/unit'
require_relative '../db/exercise'

class ExerciseTest < Test::Unit::TestCase
	def test_save_find
        name = "test exercise name"
		description = "test exercise description"
		unit_id = 999999
		
        @exercise = Exercise.create( :name => name, :description => description, :unit_id => unit_id )

        found_exercise = Exercise.find( :first, :conditions => [ "name = ?", name ] )
        
        assert_equal( unit_id, found_exercise.unit_id )
        assert_equal( name, found_exercise.name )
        assert_equal( description, found_exercise.description ) 
 
	end

    def teardown
        @exercise.destroy()
    end

end
