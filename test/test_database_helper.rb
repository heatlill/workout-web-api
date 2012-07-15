require 'rubygems'
require 'test-unit'
require_relative '../db/database_helper'

class TestDatabaseHelper < Test::Unit::TestCase   
    include DatabaseHelper
    
    
    def test_database_properties_are_loaded        
        test_params = {
            'adapter'   => 'postgresql',
            'schema'    => 'public',
            'port'      => '9998',
            'database'  => 'test',
            'password'  => 'bruiser',
            'username'  => 'postgres'
        }
        assert_equal(test_params, DatabaseHelper.get_properties)
    end
end
