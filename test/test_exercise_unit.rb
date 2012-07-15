require 'rubygems'
require 'active_record'
require 'test/unit'
require_relative '../db/exercise_unit'

class ExerciseUnitTest < Test::Unit::TestCase
    def setup
        name = 'test exercise unit name'
        description = 'test exercise description'
        @exercise_unit = ExerciseUnit.create( :name => name, :description => description )
        puts "Running #{self.class.name}"
    end
    def test_insert_find
        ExerciseUnit.transaction do
            assert_nothing_thrown do
				begin
					unit = ExerciseUnit.find( :last, :conditions => [ "name = ?", @exercise_unit.name ] )
					puts unit.name
					assert_equal( unit.name, @exercise_unit.name )
					assert_equal( unit.description, @exercise_unit.description )
				rescue ActiveRecord::ActiveRecordError => error
					$stderr.print error
					raise ActiveRecord::Rollback
				end
            end
        end
    end
    def teardown
        ExerciseUnit.delete(@exercise_unit)
    end
end
