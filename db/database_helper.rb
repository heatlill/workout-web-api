require 'rubygems'
require 'active_record'
require 'uri'

module DatabaseHelper
    #DB_PARAMS = {:adapter => "postgresql",:host => "localhost",:database => "test",:username => "postgres",:password => "test"}
    
    db = URI.parse(ENV['DATABASE_URL'] || 'postgresql://localhost/test')
    ActiveRecord::Base.establish_connection(
        :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
        :host => db.host,
        :username => db.user.nil? ? 'postgres' : db.user,
        :password => db.password.nil? ? 'test' : db.password,
        :database => db.path[1..-1],
        :encoding => 'utf8'
    )
end
