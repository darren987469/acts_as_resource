require 'spec_helper'

describe Resource::Base do
  before do
    @user = User.create!
    @project = Project.create!
  end

  describe '#acts_as_accessable' do
    it 'define has_many :resourceships association' do
      expect(@user.resourceships.count).to eq 0
    end
  end

  describe '#acts_as_resource' do
    it 'define has_many :resourceships association' do
      expect(@project.resourceships.count).to eq 0
    end
  end
end
