module Resource
  module Accessable
    extend ActiveSupport::Concern

    included do
      has_many :resourceships, as: :accessable

      def can_access?(resource)
        resourceships.where(resourceable: resource).exists?
      end
    end
  end
end
