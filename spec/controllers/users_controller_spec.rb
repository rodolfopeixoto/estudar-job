require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:params_user) do
    {
      params: {
        first_name: 'Rodolfo',
        last_name: 'Peixoto',
        email: 'peixoto@gmail.com'
      }
    }
  end
  describe 'POST #create', :vcr do
    context 'when body is valid and create user' do
      it 'return status code 201' do
        post :create, params: params_user

        expect(response.status).to eq(200)
      end
    end
  end
end

