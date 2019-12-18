require 'rails_helper'

RSpec.describe Slider, type: :model do
  describe 'Factory' do
    it 'has a valid factory' do
      # Testear que el factory definido es válido.
      expect(build(:slider)).to be_valid
    end

    describe 'Name validations' do
      it { should validate_presence_of :name }
      it { should validate_uniqueness_of :name }
    end
  end
end
