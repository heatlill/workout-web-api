require 'rubygems'
require 'active_record'
require 'uri'
require 'yaml'

module DatabaseHelper
      
    def self.read_local_yaml
        @properties = YAML::load(File.open('db/db.yaml'))
    end

    def self.get_properties
        if(@properties.nil?)
            read_local_yaml
        end
        return @properties
    end

    ActiveRecord::Base.establish_connection(DatabaseHelper.get_properties)
end
