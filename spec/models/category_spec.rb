# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Factory' do
    it 'has a valid factory' do
      # Testear que el factory definido es válido.
      expect(build(:category)).to be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:products) } ##
  end

  describe 'Presence validations' do
    it { should validate_presence_of(:name) }
  end
end
