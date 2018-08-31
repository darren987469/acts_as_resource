require 'spec_helper'

describe ActsAsResource::Accessable do
  let(:user) { User.create! }
  let(:project) { Project.create! }

  describe '#can_access?(resource)' do
    context 'when user doesn\'t have resource' do
      it { expect(user.can_access?(project)).to eq false }
    end

    context 'when user has resource' do
      before { user.projects << project }
      it { expect(user.can_access?(project)).to eq true }
    end
  end
end
