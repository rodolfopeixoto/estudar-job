require 'rails_helper'

RSpec.describe UserWorker do
  let!(:params) do
    {
      params: {
        first_name: 'Rodolfo',
        last_name: 'Peixoto',
        email: 'rodolfo@gmail.com'
      }
    }
  end
  describe '#perform', :vcr do
    context 'when user create in reqres.in' do
      it 'should be return 1 job' do
        expect { described_class.perform_async(params) }.to change {
          described_class.jobs.size }.by(1)
      end

      it 'should be return true' do
        req_res_client = instance_double(ReqResClient)
        allow(ReqResClient).to receive(:new).and_return(req_res_client)
        allow(req_res_client).to receive(:create)

        UserWorker.new.perform(params)
        expect(ReqResClient).to have_received(:new)
        expect(req_res_client).to have_received(:create)
      end
    end
  end
end
