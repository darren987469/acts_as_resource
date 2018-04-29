require 'spec_helper'

describe Resource::Accessable do
  let(:user) { User.create! }
  let(:project) { Project.create! }

  describe '#accessible_by?(accessor)' do
    context 'when user doesn\'t have resource' do
      it { expect(project.accessible_by?(user)).to eq false }
    end

    context 'when user has resource' do
      before { project.users << user }
      it { expect(project.accessible_by?(user)).to eq true }
    end
  end
end
