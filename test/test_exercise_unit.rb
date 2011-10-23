require 'rubygems'
require 'active_record'
require 'test/unit'
require_relative '../db/exercise_unit'

class ExerciseUnitTest < Test::Unit::TestCase
    def test_insert_find
        name = 'test exercise unit name'
        description = 'test exercise description'

        ExerciseUnit.transaction do
            begin
                ExerciseUnit.create( :name => name, :description => description )
        
                @unit = ExerciseUnit.find( :last, :conditions => [ "name = ?", name ] )

                assert_equal( name, @unit.name )
                assert_equal( description, @unit.description )
            rescue ActiveRecord::ActiveRecordError
                raise ActiveRecord::Rollback
            end            
        end
    end
    def teardown
        puts @unit.to_s
        ExerciseUnit.delete( @unit.id )
    end
end
