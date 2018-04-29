require 'spec_helper'

describe Resource::Accessable do
  before do
    @user = User.create!
    @project = Project.create!
  end

  describe '#can_access?' do
    it 'return false when user doesn\'t have resource' do
      expect(@user.can_access?(@project)).to eq false
    end

    it 'return true when user has resource' do
      @user.resourceships.create!(resourceable: @project)
      expect(@user.can_access?(@project)).to eq true
    end
  end
end
