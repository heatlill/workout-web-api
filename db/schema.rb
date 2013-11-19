require 'rubygems'
require 'active_record'
require_relative 'database_helper'

include DatabaseHelper

# create new
props = DatabaseHelper.get_properties()
puts 'Connecting to maintenance datatbase.'
ActiveRecord::Schema.define do
    create_table :exercise do |t|
        t.column :id, :integer, :primary_key => :id
        t.column :name, :string
        t.column :description, :string
        t.column :exercise_unit_id, :integer
    end

    create_table  :exercise_unit  do |t|
        t.column :id, :integer, :primary_key => :id
        t.column :name, :string
        t.column :description, :string
    end

    create_table  :session_exercise  do |t|
        t.column :id, :integer, :private_key => :id 
        t.column :session_id, :integer
        t.column :exercise_id, :integer
        t.column :repitition_count, :integer
    end

    create_table  :workout_session  do |t|
        t.column :id, :integer, :primary_key => :id 
        t.column :user_id, :integer
        t.column :session_date, :datetime
    end

    create_table  :user  do |t|
        t.column :id, :integer, :primary_key => :id
        t.column :user_name, :string
        t.column :first_name, :string
        t.column :last_name, :string
        t.column :password, :string
        t.column :active, :boolean
    end
end
