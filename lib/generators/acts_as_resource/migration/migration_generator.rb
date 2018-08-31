require 'rails/generators'
require 'rails/generators/migration'

module ActsAsResource
  class MigrationGenerator < Rails::Generators::Base
    include Rails::Generators::Migration

    desc 'Generates migration for acts_as_resource'
    source_root File.expand_Path('../templates', __FILE__)

    def create_migration_file
      migration_template 'migration.rb', 'db/migrate/acts_as_resource_migration.rb'
    end

    def self.next_migration_number(dirname)
      if ActiveRecord::Base.timestamped_migrations
        Time.now.utc.strftime('%Y%m%d%H%M%S')
      else
        format('%.3d', (current_migration_number(dirname) + 1))
      end
    end
  end
end
