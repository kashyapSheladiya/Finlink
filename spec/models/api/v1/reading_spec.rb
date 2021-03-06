require 'rails_helper'

RSpec.describe Api::V1::Reading, type: :model do
  context 'associations' do
    it { should belong_to(:thermostat) }
  end
end
