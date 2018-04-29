module Resource
  module Resourceable
    extend ActiveSupport::Concern

    included do
      has_many :resourceships, as: :resourceable

      def accessible_by?(accessable)
        resourceships.where(accessable: accessable).exists?
      end
    end
  end
end
