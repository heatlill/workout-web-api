#!/usr/bin/ruby
##!/Users/lilleyh/.rvm/rubies/ruby-1.9.3-p194/bin/ruby
require 'rubygems'
require 'sinatra'
require 'active_record'
require 'haml'
require_relative 'db/exercise'

use Rack::MethodOverride

set :environment, :development
set :logging, true
set :dump_errors, true

get '/workout_api/show_exercises/' do
    load_exercises()
end

post '/workout_api/delete_exercise/:id' do
    puts "Deleting id #{params[:id]}"
    Exercise.delete(params[:id])
    load_exercises()
end

post '/workout_api/save_exercise/:name/:description/:unit_id' do
    add_exercise( params[:name], params[:description], params[:unit_id] )
    redirect back
end

post '/workout_api/save_workout' do
	params[:workout]
end

def load_exercises()
		@exercises = Exercise.find( :all )
	    haml :exercises
end

def add_exercise( name, description, unit_id )
	name = params[:name] 
	description = params[:description]
	unit_id = params[:unit_id]
	begin
	Exercise.create( :name => name, :description => description, :exercise_unit_id => unit_id )
	rescue ActiveRecord::ActiveRecordError => error
		puts error
	end
end
