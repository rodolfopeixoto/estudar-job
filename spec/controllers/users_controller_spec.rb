require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:params_user) do
    {
      'email' => 'rodolfog.peixot@example.com',
      'first_name' => 'Rodolfo',
      'last_name' => 'Peixoto'
    }
  end
  describe 'POST #create', :vcr do
    context 'when body is valid and create user' do
      it 'return status code 201' do
        post :create, params: params_user

        expect(response.status).to eq(302)
      end
    end
  end
end
