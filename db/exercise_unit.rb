require 'rubygems'
require 'active_record'
require_relative 'database_helper'

class ExerciseUnit < ActiveRecord::Base
    include DatabaseHelper
    self.table_name='exercise_unit'
    self.primary_key='id'
    def to_s
        puts "#{id} #{name} #{description}"
    end
end
