class User < ActiveRecord::Base
  self.table_name = 'users'

  acts_as_accessable
end
