require 'rails_helper'

RSpec.describe Buy, type: :model do
  describe 'Factory' do
    it 'has a valid factory' do
      expect(create(:buy, :buy_with_user_items)).to be_valid
    end
  end
  describe 'Associations' do
    it { should have_many(:items) }
    it { should belong_to(:user) }
  end
  describe 'Presence validations' do
    it 'user_valid' do
      user = create(:client)
      buy = build(:buy, :buy_with_user_items, user: user)
      product = create(:product, :product_image_principal)
      buy.items.<< Item.new(price: product.price,
      count: 4,
      product: product,
      buy: buy)
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
