require 'spec_helper'

describe ActsAsResource::Base do
  let(:user) { User.create! }
  let(:project) { Project.create! }

  describe '#acts_as_accessable' do
    it 'define has_many :resourceships association' do
      expect(user.resourceships.count).to eq 0
    end

    it 'define has_many :resources association' do
      expect(user.projects.count).to eq 0
    end

    it 'delete_all dependent resourcehships when accessable destroy' do
      user.projects << project
      expect { user.destroy }.to change { Resourceship.count }.from(1).to(0)
    end
  end

  describe '#acts_as_resource' do
    it 'define has_many :resourceships association' do
      expect(project.resourceships.count).to eq 0
    end

    it 'define has_many :accessors association' do
      expect(project.users.count).to eq 0
    end

    it 'delete_all dependent resourceships when resource destroy' do
      project.users << user
      expect { project.destroy }.to change { Resourceship.count }.from(1).to(0)
    end
  end
end
