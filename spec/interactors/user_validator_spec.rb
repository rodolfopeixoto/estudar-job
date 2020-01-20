require 'rails_helper'

RSpec.describe UserValidator do
  let!(:params_user) do
    {
      email: 'rodolfog.peixot@example.com',
      first_name: 'Rodolfo',
      last_name: 'Peixoto'
    }
  end

  let!(:params_invalid) do
    {
      email: 'michael.lawson@reqres.in',
      first_name: 'Michael',
      last_name: 'Lawson'
    }
  end

  describe '.call', :vcr do
    context 'when is valid params' do
      it 'should be return true' do
        user_validator = described_class.call(params_user)
        expect(user_validator.success?).to be true
      end
    end
    context 'when is invalid params' do
      it 'should be return fail message' do
        user_validator = described_class.call(params_invalid)
        expect(user_validator.message).to eq('There is already a registered user')
      end
    end
  end
end
