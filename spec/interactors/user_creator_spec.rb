require 'rails_helper'

RSpec.describe UserCreator do
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
        req_res_client = instance_double(ReqResClient)
        allow(ReqResClient).to receive(:new).and_return(req_res_client)
        allow(req_res_client).to receive(:create)

        UserCreator.call(params_user)
        expect(ReqResClient).to have_received(:new)
        expect(req_res_client).to have_received(:create)
      end
    end
  end
end
