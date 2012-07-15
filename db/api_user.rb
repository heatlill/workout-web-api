class ApiUser < ActiveRecord::Base
    include DatabaseHelper
    self.table_name = 'api_user'
    self.primary_key = 'id'
    
    def initialize(props, arg2)
        init
        super(props, arg2)
    end
    def to_s
        puts "{id:#{id},first_name:#{first_name},middle_name:#{middle_name},last_name:#{last_ame},user_id#{user_id},create_date:#{create_date}"
    end
end
