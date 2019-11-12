require 'rails_helper'

RSpec.describe Tag, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Factory' do
    it 'has a valid factory' do
      # Testear que el factory definido es válido.
      expect(build(:tag)).to be_valid
      #expect(build(:tool, location: Location.new(name: 'Sta 72'), category: Category.new(name: 'Chainsaw'))).to be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:products).through(:product_tags) }
  end

  describe 'Presence validations' do
    it { should validate_presence_of(:name) }
  end

end
