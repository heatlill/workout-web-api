require 'rubygems'
require 'active_record'
require_relative 'database_helper'

ActiveRecord::Base.establish_connection({
    :adapter => "mysql",
    :host => "localhost",
    :database => "test",
    :username=> "root"
}) 

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
