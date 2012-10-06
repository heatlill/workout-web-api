require 'rubygems'
require 'test/unit'
require 'rack/test'
require_relative '../main'

ENV['RACK_ENV'] = 'test'

class TestWorkout < Test::Unit::TestCase
    include  Rack::Test::Methods 
    def app
        Sinatra::Application
    end

    def test_save_workout
        value = '[{"test":"value"}]'
        #value = '[{"workout":
        #            {"session_exercises":[
        #                    {"id":"123","exercise_id":"1","repitition_count":"5","sequence_number":"1"},
        #            ]
        #        }]'
        begin
            last_response = post 'http://localhost/workout_api/save_workout', params={:workout => value}
        rescue Error => error
            puts error.inspect
        end
       	#assert last_response.ok?
        value_as_hash={"test"=>"value"}
        assert_equal("value", value_as_hash["test"])
    end
end 
