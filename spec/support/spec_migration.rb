class SpecMigration < ActsAsResource::MIGRATION_BASE_CLASS
  def self.up
    create_table Project do |t|
      t.column :name, :string
    end

    create_table User do |t|
      t.column :name, :string
    end
  end
end
