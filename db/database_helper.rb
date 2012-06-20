require 'rubygems'
require 'active_record'
require 'uri'

module DatabaseHelper
    #DB_PARAMS = {:adapter => "postgresql",:host => "localhost",:database => "test",:username => "postgres",:password => "bruiser"}
    
    db = URI.parse(ENV['DATABASE_URL'] || 'postgresql://localhost/test')
    DB_PARAMS = {    
        :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
        :host => db.host,
        :username => db.user.nil? ? 'postgres' : db.user,
        :password => db.password.nil? ? 'bruiser' : db.password,
        :database => db.path[1..-1],
        :encoding => 'utf8'
    }
    ActiveRecord::Base.establish_connection(DB_PARAMS)
end
