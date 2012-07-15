require 'rubygems'
require 'active_record'
require 'test/unit'
require_relative '../db/exercise'
require_relative '../db/exercise_unit'

class ExerciseTest < Test::Unit::TestCase
    def setup
        puts "Running: #{self.class.name}"
        name = "test exercise name"
		description = "test exercise description"
        exercise_unit_id = 1
        #@exercise = Exercise.create( :name => name, :description => description, :exercise_unit_id => exercise_unit_id )
    end
	def test_save_find
        assert_nothing_thrown do
            Exercise.transaction do
                begin
                    exercise = Exercise.find( :first, :conditions => [ "name = ?", @exercise.name ] )
                    assert_equal( @exercise.exercise_unit_id, exercise.exercise_unit_id )
                    assert_equal( @exercise.name, exercise.name )
                    assert_equal( @exercise.description, exercise.description ) 
                rescue ActiveRecord::ActiveRecordError => error
                    $stderr.print error
                    raise ActiveRecord::Rollback
                end
            end
        end
 
	end

    def teardown
        Exercise.delete(@exercise)
    end

end
