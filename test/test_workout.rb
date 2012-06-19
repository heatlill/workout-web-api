#/usr/bin/ruby
require 'rubygems'
require 'test/unit'
require 'rack/test'

#set :environment, :test
ENV['RACK_ENV'] = 'test'

class TestWorkout < Test::Unit::TestCase
    include  Rack::Test::Methods

    def app
        Sinatra::Application
    end

    def test_save_workout
        value = '{"test":"value"}'
        returnedValue = post '/workout_api/save_workout', params={:workout => value}
        assert last_response.ok?
        assert_equal value, last_response.body
    end
end 
