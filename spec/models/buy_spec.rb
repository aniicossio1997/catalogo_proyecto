require 'rails_helper'

RSpec.describe Buy, type: :model do
  describe 'Factory' do
    it 'has a valid factory' do
      expect(build(:tag)).to be_valid
    end
  end
  describe 'Associations' do
    it { should have_many(:items) }
    it { should belong_to(:user) }
  end
  describe 'Presence validations' do
    it 'user_valid' do
      buy = build(:buy)
      user = create(:client)
      buy.user = user
      expect { buy.save }.to change{ Buy.count }.from(0).to(1)
    end
    it 'user_invalid' do
      buy = build(:buy)
      user = create(:admin)
      buy.user = user
      expect { buy.save }.to_not change{ Buy.count }
    end
  end
end
