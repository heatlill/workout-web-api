##!/usr/bin/ruby
#!/home/heath/.rvm/rubies/ruby-1.9.2-p180/bin/ruby

require 'rubygems'
require 'sinatra'
require 'active_record'
require_relative 'exercise'
require 'haml'
ActiveRecord::Base.establish_connection(
  :adapter => "mysql",
  :host => "localhost",
  #:username => "<your database username>",
  #:password => "<your database password>",
  :database => "test"
)

get '/workout_api/exercises/' do
	
end

get '/workout_api/show_exercises/' do
	exercises = Exercise.find( :all )
	@exercises = exercises
	haml :exercises
end

delete '/workout_api/delete_exercise/:id' do
	id = params[:id]
	Exercise.delete( :id => id )
end

post '/workout_api/save_exercise/:name/:description/:unit_id' do
	name = params[:name] 
	description = params[:description]
	unit_id = params[:unit_id]
	Exercise.create( :name => name, :description => description, :unit_id => unit_id )
end
