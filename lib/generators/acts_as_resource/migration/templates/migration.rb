class ActsAsResourceMigration < ActsAsResource::MIGRATION_BASE_CLASS
  def self.up
    create_table Resourceship, force: true, options: create_options do |t|
      t.references :accessable, polymorphic: { null: false }
      t.references :resourceable, polymorphic: { null: false }
    end

    add_index(
      Resourceship,
      %i[accessable_id accessable_type resourceable_id resourceable_type],
      name: 'relationships_accesable_resourceable_index',
      unique: true
    )
  end

  def self.down
    drop_table Resourceship
  end

  def self.create_options
    options = ''
    if defined?(ActiveRecord::ConnectionAdapters::Mysql2Adapter) \
      && ActiveRecord::Base.connection.instance_of?(ActiveRecord::ConnectionAdapters::Mysql2Adapter)
      options = 'DEFAULT CHARSET=latin1'
    end
    options
  end
end
