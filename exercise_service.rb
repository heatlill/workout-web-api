require 'rubygems'
require 'active_record'
require_relative 'db/exercise'

class ExerciseService
    def initialize
    end
    
    def create( params )
        name = params[:name] 
        description = params[:description]
        unit_id = params[:unit_id]
        begin
            return Exercise.create( :name => name, :description => description, :exercise_unit_id => unit_id )
        rescue ActiveRecord::ActiveRecordError => error
            puts error
        end 
    end
    def delete ( id )
        Exercise.delete(id)
    end 
    def find( search_criteria )
        if(search_criteria.nil?)
            return Exercise.find(:all)
        else
            return Exercise.find(criteria)
        end 
    end
    def update( exercise )
        Exercise.update()
    end
end
