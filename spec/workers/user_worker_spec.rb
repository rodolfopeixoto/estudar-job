require 'rails_helper'

RSpec.describe UserWorker do
  let!(:params) do
    { 
      email: "rodolfog.peixot@example.com",
      first_name: "Rodolfo",
      last_name: "Peixoto"
    }
  end
  describe '#perform', :vcr do
    context 'when user create in reqres.in' do
      it 'should be return 1 job' do
        expect { described_class.perform_async(params) }.to change {
          described_class.jobs.size }.by(1)
      end

      it 'should be execute' do
        interactor = instance_double(Interactor::Context)
        allow(PlaceUserCreator).to receive(:call).with(params).and_return(interactor)
        allow(interactor).to receive(:success?).and_return(true)
        UserWorker.new.perform(params)
        expect(PlaceUserCreator).to have_received(:call)
      end
    end
  end
end
