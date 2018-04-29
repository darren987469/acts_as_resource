require 'spec_helper'

describe Resource::Accessable do
  before do
    @user = User.create!
    @project = Project.create!
  end

  describe '#accessible_by?' do
    it 'return false when user doesn\'t have resource' do
      expect(@project.accessible_by?(@user)).to eq false
    end

    it 'return true when user has resource' do
      @user.resourceships.create!(resourceable: @project)
      expect(@project.accessible_by?(@user)).to eq true
    end
  end
end
