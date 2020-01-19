require 'rails_helper'

RSpec.describe UserCreator do
  let!(:params_user) do
    {
      params: {
        first_name: 'Rodolfo',
        last_name: 'Peixoto',
        email: 'peixoto@gmail.com'
      }
    }
  end

  describe '.call', :vcr do
    context 'when is valid params' do
      it 'return success' do
        user_creator = UserCreator.call(params_user)
        params = user_creator.params
        expect(params[:first_name]).to eq('Rodolfo')
      end
    end
  end
end
