require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'Factory' do
    it 'has a valid factory' do
      expect(build(:profile)).to be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:users) }
  end
end