#!/usr/bin/ruby

require 'rubygems'
require 'sinatra'
require 'active_record'
require 'haml'
require_relative 'db/database_helper'
require_relative 'db/exercise'

include DatabaseHelper
use Rack::MethodOverride

get '/workout_api/show_exercises/' do
    loadExercises()
end

post '/workout_api/delete_exercise/:id' do
    puts "Deleting id #{params[:id]}"
    Exercise.delete(params[:id])
    loadExercises()
end

post '/workout_api/save_exercise/:name/:description/:unit_id' do
    addExercise( params[:name], params[:description], params[:unit_id] )
    redirect back
end

def loadExercises()
	exercises = Exercise.find( :all )
	@exercises = exercises
	haml :exercises
end

def addExercise( name, description, unit_id )
	name = params[:name] 
	description = params[:description]
	unit_id = params[:unit_id]
	Exercise.create( :name => name, :description => description, :exercise_unit_id => unit_id )
end
