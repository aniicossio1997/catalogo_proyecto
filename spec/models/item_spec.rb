# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"
  
  describe 'Factory' do
    it 'has a valid factory' do
      expect(build(:item)).to be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:product) }
    it { should belong_to(:buy) }
  end
end
