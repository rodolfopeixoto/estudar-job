require 'rails_helper'
RSpec.describe PlaceUserCreator do
  let!(:params_user) do
    {
      email: 'rodolfog.peixot@example.com',
      first_name: 'Rodolfo',
      last_name: 'Peixoto'
    }
  end
  describe '.call', :vcr do
    context 'when is valid params' do
      it 'return success' do
        allow(UserValidator).to receive(:call).with(params_user) { :success }
        allow(UserCreator).to receive(:call).with(params_user) { :success }
        expect(described_class.organized).to eq([UserValidator, UserCreator])
      end
    end
  end
end
