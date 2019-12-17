require 'rails_helper'

RSpec.describe Config, type: :model do
  describe 'Factory' do
    it 'has a valid factory' do
      expect(build(:config)).to be_valid
    end
  end

  describe 'Presence validation' do
    it { should validate_presence_of :per_page }
  end

  describe 'Numericality validation' do
    it { should validate_numericality_of :per_page, greater_than: 0 }
  end
end
