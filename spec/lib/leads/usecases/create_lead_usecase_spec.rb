require 'spec_helper'
require 'leads/usecases/create_lead_usecase'
require 'leads/entities/lead'

RSpec.describe Leads::Usecases::CreateLeadUsecase do
  let(:gateway) { instance_double('Leads::LeadGateway') }
  let(:usecase) { described_class.new(gateway) }

  describe '#run' do
    let(:new_lead) do
      Leads::Entities::Lead.new(
        email: 'example@example.com',
        name: 'Foo',
        phone: '99 99999 9999'
      )
    end

    it 'creates lead' do
      expect(gateway).to receive(:create_lead).with(new_lead)

      usecase.run(new_lead)
    end
  end
end
