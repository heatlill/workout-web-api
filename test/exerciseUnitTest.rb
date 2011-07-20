require 'rubygems'
require 'active_record'
require 'test/unit'
require_relative '../db/exerciseUnit'

class ExerciseUnitTestCase < Test::Unit::TestCase
    def test_save_find
        name = 'test exercise unit name'
        description = 'test exercise description'

        @unit = ExerciseUnit.create( :name => name, :description => description )
        found_unit = ExerciseUnit.find( :last )
        p found_unit.name
        assert( name + "foo", found_unit.name )
    end
    def teardown
        @unit.destroy
    end
end
