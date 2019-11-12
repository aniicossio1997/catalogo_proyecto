require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Factory' do
    it 'has a valid factory' do
      # Testear que el factory definido es válido.
      expect(build(:user)).to be_valid
    end
  end

  describe 'Presence validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

end
