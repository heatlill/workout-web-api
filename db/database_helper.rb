require 'rubygems'
require 'active_record'
require 'uri'
require 'yaml'

module DatabaseHelper
      
    def self.read_local_yaml
        file = ENV['DB_YML']
        #url = ||= 'db/db.yaml'
        @properties = YAML::load(File.open(file)) 
    end

    def self.get_properties
        if(@properties.nil?)
            read_local_yaml
        end
        return @properties
    end

    ActiveRecord::Base.establish_connection(DatabaseHelper.get_properties)
end
