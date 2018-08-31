require 'active_record'

require 'acts_as_resource/accessable'
require 'acts_as_resource/resourceable'
require 'acts_as_resource/resourceship'
require 'acts_as_resource/base'
require 'acts_as_resource/version'

ActiveRecord::Base.send :include, ActsAsResource

ActsAsResource::MIGRATION_BASE_CLASS =
  if ActiveRecord::VERSION::MAJOR >= 5
    ActiveRecord::Migration[5.0]
  else
    ActiveRecord::Migration
  end
