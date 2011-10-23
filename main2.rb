require 'rubygems'
require 'sinatra'
require 'exercise'

get '/' do
	'test'
end
get '/workout_api' do 
	'foo'#"name = #{:name}, description = #{:description}, unit_id = #{:unit_id}"	
end
get '/workout_api/:activity/:name/:description/:unit_id' do
	if ( params[:activity] == 'save_exercise' )
		exercise = Exercise.new( )#:name => params[:name], :description => params[:name], :unit_id => params[:unit_id] )
#		exercise.name = params[:name]
#		exercise.description = params[:description]
#		exercise.unit_id[:unit_id]
#		"<pre>"+exercise.to_s+"</pre>"
#		exercise.save_to_database()
	end
end
