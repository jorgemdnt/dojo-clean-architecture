require 'rails_helper'
require 'leads/entities/lead'

RSpec.describe Leads::LeadActiveRecordGateway do
  let(:gateway) { described_class.new }

  describe '#create_lead' do
    context 'when received entity' do
      let(:new_lead) do
        Leads::Entities::Lead.new(
            email: 'example@example.com',
            name: 'Foo',
            phone: '99 99999 9999'
        )
      end

      it 'should created lead' do
        gateway.create_lead(new_lead)
        created_lead = Leads::LeadModel.first
        expect(created_lead)
            .to have_attributes(
                    id: be_an(Integer),
                    email: 'example@example.com',
                    name: 'Foo',
                    phone: '99 99999 9999'
                )
      end

      it 'should return created lead' do
        created_lead = gateway.create_lead(new_lead)
        expect(created_lead)
            .to have_attributes(
                    id: be_an(Integer),
                    email: 'example@example.com',
                    name: 'Foo',
                    phone: '99 99999 9999'
                )
      end
    end
  end
end
