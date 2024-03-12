
require 'rails_helper'

RSpec.describe Rooster, type: :model do
  context 'when creating rooster' do
    let(:rooster) { build :rooster }

    it 'should be valid with all attributes' do
      expect(rooster.valid?).to eq(true)
    end

    it 'should be invalid without a name' do
      rooster.name = nil
      expect(rooster.valid?).to eq(false)
    end

  end
end

