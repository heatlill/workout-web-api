require 'rubygems'
require 'test-unit'
require_relative '../db/database_helper'

class TestDatabaseHelper < Test::Unit::TestCase   
    include DatabaseHelper
    
    
    def test_read_local_yaml
        assert_equal(get_properties['database_url'], 'postgresql://localhost:9998/test')
    end

    def test_database_properties_are_loaded        
        test_params = {
            :adapter => 'postgresql',
            :encoding => 'utf8',
            :host => 'localhost',
            :port => 9998,
            :username => 'postgres',
            :password => 'bruiser',
            :database => 'test',
            :encoding => 'utf8',
            :schema => 'public'
        }
        assert_equal(test_params, load_database_properties)
    end
end
