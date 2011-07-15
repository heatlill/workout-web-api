require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "mysql",
  :host => "localhost",
  #:username => "<your database username>",
  #:password => "<your database password>",
  :database => "test"
)

class Exercise < ActiveRecord::Base
	set_table_name( 'exercises' )
	set_primary_key( 'id' )
end
