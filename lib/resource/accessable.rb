module Resource
  module Accessable
    extend ActiveSupport::Concern

    included do
      has_many :resourceships, as: :accessable, dependent: :delete_all

      def can_access?(resource)
        resourceships.where(resourceable: resource).exists?
      end
    end
  end
end
