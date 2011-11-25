##!/usr/bin/ruby
#!/home/heath/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

require 'rubygems'
require 'sinatra'
require 'active_record'
require 'haml'
require_relative 'db/database_helper'
require_relative 'db/exercise'

#ActiveRecord::Base.establish_connection(
#  :adapter => "mysql",
#  :host => "localhost",
#  #:username => "<your database username>",
#  #:password => "<your database password>",
#  :database => "test"
#)
include DatabaseHelper
use Rack::MethodOverride

get '/' do
    'Hello World!'	
end

get '/workout_api/show_exercises/' do
	exercises = Exercise.find( :all )
	@exercises = exercises
	haml :exercises
end

post '/workout_api/delete_exercise/:id' do
	Exercise.delete( params[:id] )
    redirect back
end

post '/workout_api/save_exercise/:name/:description/:unit_id' do
    addExercise( params[:name], params[:description], params[:unit_id] )
    redirect back
end

def addExercise( name, description, unit_id )
	name = params[:name] 
	description = params[:description]
	unit_id = params[:unit_id]
	Exercise.create( :name => name, :description => description, :exercise_unit_id => unit_id )
end
