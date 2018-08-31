module ActsAsResource
  def self.included(base)
    base.extend Base
  end

  module Base
    def acts_as_accessable(options = {})
      return if Resourceship.accessable_classes.include?(self)

      include ActsAsResource::Accessable

      return unless options[:resources]

      options[:resources].each do |resource|
        has_many resource,
                 through: :resourceships,
                 source: :resourceable,
                 source_type: resource.to_s.singularize.classify
      end
    end

    def acts_as_resource(options = {})
      return if Resourceship.resourceable_classes.include?(self)

      include ActsAsResource::Resourceable

      return unless options[:accessors]

      options[:accessors].each do |accessor|
        has_many accessor,
                 through: :resourceships,
                 source: :accessable,
                 source_type: accessor.to_s.singularize.classify
      end
    end
  end
end
