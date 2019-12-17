# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Factory' do
    it 'has a valid factory' do
      # Testear que el factory definido es válido.
      # prdoductot debe tener active en true
      expect(build(:product, :product_image_principal)).to be_valid
    end
  end
  describe 'validations fails' do
    it 'dont without category' do
      product = build(:product)
      product.category = nil
      expect(product.save).to be false
      expect(product.errors.messages[:category]).to eq [I18n.t('errors.messages.required'),I18n.t('errors.messages.blank')]

    end
  end

  describe 'Associations' do
    it { should belong_to(:category) }
  end

  describe 'Presence validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:cost) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:category) }
  end
end