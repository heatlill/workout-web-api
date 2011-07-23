require 'rubygems'
require 'active_record'
require 'test/unit'
require_relative '../db/exercise_unit'

class ExerciseUnitTest < Test::Unit::TestCase
    def test_insert_find
        name = 'test exercise unit name'
        description = 'test exercise description'

        Exercise.transaction do
            @unit = ExerciseUnit.create( :name => name, :description => description )
        
            found_unit = ExerciseUnit.find( :first, :conditions => [ "name = ?", name ] )

            assert_equal( name, found_unit.name )
            assert_equal( description, found_unit.description )
        end
    end
    def teardown
        @unit.delete( @unit.id )
    end
end
