class Resourceship < ActiveRecord::Base
  class_attribute :accessable_classes
  class_attribute :resourceable_classes

  self.accessable_classes = []
  self.resourceable_classes = []

  belongs_to :accessable, polymorphic: true
  belongs_to :resourceable, polymorphic: true
end
