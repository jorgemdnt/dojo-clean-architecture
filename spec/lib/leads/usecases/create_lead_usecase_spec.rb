require 'spec_helper'
require 'leads/usecases/create_lead_usecase'

RSpec.describe Leads::Usecases::CreateLeadUsecase do
  let(:gateway) { instance_double('Leads::LeadGateway') }
  let(:usecase) { described_class.new(gateway) }

  describe '#run' do
    let(:new_lead) do
      Leads::Entities::Lead.new(
        email: 'example@example.com',
        name: 'Foo',
        phone: ''
      )
    end

    it 'creates lead' do
      usecase.run()
    end
  end
end
