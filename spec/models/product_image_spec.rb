require 'rails_helper'

RSpec.describe ProductImage, type: :model do
  describe 'Factory' do
    it 'has a valid factory' do
      # Testear que el factory definido es válido.
      expect(build(:product_image)).to be_valid
    end
  end
end
