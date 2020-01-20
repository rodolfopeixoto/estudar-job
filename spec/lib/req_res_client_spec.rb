require 'rails_helper'

RSpec.describe ReqResClient, :vcr do
  let!(:params) do
    { 
      "email"=>"rodolfog.peixot@example.com",
      "first_name"=>"Rodolfo",
      "last_name"=>"Peixoto"
    }
  end
  describe '#create' do
    context 'when params is valid' do
      it 'should be return true' do
        req_res_client = described_class.new
        expect(req_res_client.create(params)).to be true
      end
    end
  end

  describe '#users_by_page' do
    context 'when return all users by page' do
      it 'should be return user' do
        req_res_client = described_class.new
        users = req_res_client.users
        user = users['data'][0]['first_name']
        expect(user).to eq('Michael')
      end
    end
  end
end
