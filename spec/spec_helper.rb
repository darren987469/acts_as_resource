require 'bundler/setup'
require 'pry'
require 'pry-byebug'

require 'coveralls'
Coveralls.wear!

require "resource"
require 'generators/resource/migration/templates/migration.rb'

require 'app/models/user'
require 'app/models/project'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.expose_dsl_globally = true

  config.before :suite do
    setup_db
  end

  config.before :each do
    clear_db
  end

  config.after :each do
    clear_db
  end

  config.after :suite do
    teardown_db
  end
end

def setup_db
  db_config = YAML.load_file('spec/database.yml').fetch(ENV["DB"] || "sqlite")
  ActiveRecord::Base.establish_connection(db_config)
  ActiveRecord::Schema.verbose = false

  ResourceMigration.up
  SpecMigration.up
end

def clear_db
  User.delete_all
  Project.delete_all
  Resourceship.delete_all
end

def teardown_db
  if ActiveRecord::VERSION::MAJOR >= 5
    tables = ActiveRecord::Base.connection.data_sources
  else
    tables = ActiveRecord::Base.connection.tables
  end

  tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end
end
