module Resource
  def self.included(base)
    base.extend Base
  end

  module Base
    def acts_as_accessable
      unless Resourceship.accessable_classes.include?(self)
        include Resource::Accessable
      end
    end

    def acts_as_resource
      unless Resourceship.resourceable_classes.include?(self)
        include Resource::Resourceable
      end
    end
  end
end
