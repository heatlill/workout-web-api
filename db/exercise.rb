require 'rubygems'
require 'active_record'
require_relative 'database_helper'

class Exercise < ActiveRecord::Base
    include DatabaseHelper
	self.table_name = 'exercise'
	self.primary_key='id'

    def initialize(props, arg2)
        init
        super(props, arg2)
    end

    def to_s
        puts  "#{id} #{name} #{description} #{exercise_unit_id}"
    end
end
