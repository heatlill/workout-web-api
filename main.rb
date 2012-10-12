require 'rubygems'
require 'sinatra'
require 'active_record'
require 'haml'
require 'json'
require_relative 'db/exercise'
require_relative 'exercise_service'

use Rack::MethodOverride

set :environment, :development
set :logging, true
set :dump_errors, true

@@exercise_service = ExerciseService.new

get '/workout_api/show_exercises/' do
    @exercises = @@exercise_service.find( nil )
	haml :exercises
end

post '/workout_api/delete_exercise/:id' do
    @@exercise_service.delete( params[:id] )
    redirect back
end

post '/workout_api/save_exercise/:name/:description/:unit_id' do
    @@exercise_service.create( params )
    redirect back
end

post '/workout_api/save_workout' do
    workout = JSON.parse(params[:workout])
    return workout
end

