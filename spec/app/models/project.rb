class Project < ActiveRecord::Base
  self.table_name = 'projects'

  acts_as_resource accessors: [:users]
end
