require 'rubygems'
require 'active_record'
require 'uri'
require 'yaml'

module DatabaseHelper
      
    def read_local_yaml
        puts 'Reading local yaml'
        @properties = YAML::load(File.open('db/db.yaml'))
        puts "loaded properties: #{@properties}"
    end

    def load_database_properties(*force_load)
        if(force_load or @db_params.nil?)
            puts force_load
            db = URI.parse(ENV['DATABASE_URL'] || get_properties['database_url'])
            @db_params = {    
                :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
                :host => db.host,
                :port => db.port,
                :username => db.user.nil? ? 'postgres' : db.user,
                :password => db.password.nil? ? 'bruiser' : db.password,
                :database => db.path[1..-1],
                :encoding => 'utf8',
                :schema => get_properties['schema']
            }
            puts "Loaded db_parameters:  #{@db_params}"
        end
        return @db_params
    end
    
    def get_db_params
        if (@db_params.nil? || @db_params.empty?)
            load_database_properties(true)
        end
        return @db_params
    end
    def get_properties
        if(@properties.nil?)
            read_local_yaml
        end
        return @properties
    end
    def init
        connect_to_database
    end

    
    ActiveRecord::Base.establish_connection(load_database_properties)
end
