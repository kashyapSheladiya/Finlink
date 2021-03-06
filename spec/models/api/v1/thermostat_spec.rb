require 'rails_helper'

RSpec.describe Api::V1::Thermostat, type: :model do
  let!(:stat1) {create(:stat1)}
  let!(:stat2) {create(:stat2)}

  context 'validation' do
    it 'household_token cannot be empty' do
      stat2.household_token = ""
      expect(stat2).to_not be_valid
    end

    it 'household_token should be unique' do
      stat1.household_token = "othz6i0raq22rlk1mxqmg8e0635qxtdl" # token of stat 2
      expect(stat1).to_not be_valid
    end

    it 'household_token should be of 32 characters' do
      expect(stat1.household_token.size).to eq(32)
      stat2.household_token = "12ab"
      expect(stat2).to_not be_valid
    end
  end
  
  context 'associations' do
    it { should have_many(:readings) }
  end
end
