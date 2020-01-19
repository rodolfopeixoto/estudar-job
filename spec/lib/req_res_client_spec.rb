require 'rails_helper'

RSpec.describe ReqResClient do
  let!(:params) do
    {
      params: {
        first_name: 'Rodolfo',
        last_name: 'Peixoto',
        email: 'rodolfo@gmail.com'
      }
    }
  end
  describe '#create', :vcr do
    context 'when params is valid' do
      it 'should be return true' do
        req_res_client = described_class.new(params)
        expect(req_res_client.create).to be true
      end
    end
  end
end
