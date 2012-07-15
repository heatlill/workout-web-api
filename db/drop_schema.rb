#!/usr/bin/ruby

require 'rubygems'
require 'active_record'
require_relative 'database_helper'

include DatabaseHelper

# delete old
load_database_properties(true)
puts 'Connecting to maintenance datatbase.'
ActiveRecord::Base.establish_connection(get_db_params.merge('database' => 'template1', 'schema_search_path' => 'public'))
puts "Dropping schema: #{get_db_params[:schema]}."
ActiveRecord::Base.connection.execute("drop schema #{get_db_params[:schema]} cascade")
  
ActiveRecord::Base.connection.close
