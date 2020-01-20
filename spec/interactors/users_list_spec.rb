require 'rails_helper'

RSpec.describe UsersList do
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
      it 'return success' do
        req_res_client = instance_double(ReqResClient)
        allow(ReqResClient).to receive(:new).and_return(req_res_client)
        allow(req_res_client).to receive(:users)

        UsersList.call(params_user)
        expect(ReqResClient).to have_received(:new)
        expect(req_res_client).to have_received(:users)
      end
    end
    context 'when is invalid params' do
      it 'return success' do
        req_res_client = instance_double(ReqResClient)
        allow(ReqResClient).to receive(:new).and_return(req_res_client)
        allow(req_res_client).to receive(:users)

        users_list = UsersList.call(params_invalid)
        expect(ReqResClient).to have_received(:new)
        expect(req_res_client).to have_received(:users)
        expect(users_list.message).to eq 'There are no users in this list'
      end
    end
  end
end
