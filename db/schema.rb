require 'rubygems'
require 'active_record'
require_relative 'database_helper'

include DatabaseHelper

# create new
load_database_properties(true)
puts 'Connecting to maintenance datatbase.'
ActiveRecord::Base.establish_connection(get_db_params.merge('database' => 'template1', 'schema' => 'public'))
puts "Creating new schema #{get_db_params[:schema]}."
ActiveRecord::Base.connection.execute("create schema #{get_db_params[:schema]}")  

ActiveRecord::Schema.define do
    create_table ( :exercise ) do |t|
        t.column :id, :integer, :primary_key => :id
        t.column :name, :string
        t.column :description, :string
        t.column :exercise_unit_id, :integer
    end

    create_table ( :exercise_unit ) do |t|
        t.column :id, :integer, :primary_key => :id
        t.column :name, :string
        t.column :description, :string
    end

    create_table ( :session_exercise ) do |t|
        t.column :id, :integer, :private_key => :id 
        t.column :session_id, :integer
        t.column :exercise_id, :integer
        t.column :unit_quantity, :integer
    end

    create_table ( :workout_session ) do |t|
        t.column :id, :integer, :primary_key => :id 
        t.column :user_id, :integer
        t.column :session_date, :datetime
    end

    create_table ( :user ) do |t|
        t.column :id, :integer, :primary_key => :id
        t.column :user_name, :string
        t.column :first_name, :string
        t.column :last_name, :string
        t.column :password, :string
        t.column :active, :boolean
    end
end
