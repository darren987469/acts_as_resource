require 'active_record'

require 'resource/accessable'
require 'resource/resourceable'
require 'resource/resourceship'
require 'resource/base'
require "resource/version"

ActiveRecord::Base.send :include, Resource

Resource::MIGRATION_BASE_CLASS = if ActiveRecord::VERSION::MAJOR >= 5
  ActiveRecord::Migration[5.0]
else
  ActiveRecord::Migration
end
