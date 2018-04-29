module ActsAsResource
  module Resourceable
    extend ActiveSupport::Concern

    included do
      has_many :resourceships, as: :resourceable, dependent: :delete_all

      def accessible_by?(accessable)
        resourceships.where(accessable: accessable).exists?
      end
    end
  end
end
