# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"
 
 describe 'Factory' do
    it 'has a valid factory' do
      # Testear que el factory definido es válido.
      # prdoducto debe tener active en true
      expect(build(:profile)).to be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:users) }
  end
end