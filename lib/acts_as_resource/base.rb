module ActsAsResource
  def self.included(base)
    base.extend Base
  end

  module Base
    def acts_as_accessable(options = {})
      unless Resourceship.accessable_classes.include?(self)
        include ActsAsResource::Accessable

        if options[:resources]
          options[:resources].each do |resource|
            has_many resource, through: :resourceships, source: :resourceable, source_type: resource.to_s.singularize.classify
          end
        end
      end
    end

    def acts_as_resource(options = {})
      unless Resourceship.resourceable_classes.include?(self)
        include ActsAsResource::Resourceable

        if options[:accessors]
          options[:accessors].each do |accessor|
            has_many accessor, through: :resourceships, source: :accessable, source_type: accessor.to_s.singularize.classify
          end
        end
      end
    end
  end
end
