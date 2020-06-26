require 'spec_helper'
require 'leads/usecases/create_lead_usecase'
require 'leads/entities/lead'

RSpec.describe Leads::Usecases::CreateLeadUsecase do
  let(:gateway) { instance_double('Leads::LeadGateway') }
  let(:presenter) { instance_double('Leads::CreateLeadPresenter') }
  let(:usecase) { described_class.new(gateway, presenter) }

  describe '#run' do
    context 'when email is valid' do
      let(:new_lead) do
        Leads::Entities::Lead.new(
          email: 'example@example.com',
          name: 'Foo',
          phone: '99 99999 9999'
        )
      end

      let(:created_lead) do
        Leads::Entities::Lead.new(
          id: 1,
          email: 'example@example.com',
          name: 'Foo',
          phone: '99 99999 9999'
        )
      end

      it 'creates lead' do
        expect(gateway).to receive(:create_lead).with(new_lead)

        usecase.run(new_lead)
      end

      it 'presents success' do
        allow(gateway).to receive(:create_lead).with(new_lead).and_return(created_lead)

        expect(presenter).to receive(:created_with_success).with(new_lead)

        usecase.run(new_lead)
      end
    end

    context 'when email is invalid' do
      let(:new_lead_with_empty_email) do
        Leads::Entities::Lead.new(
          email: '',
          name: 'Foo',
          phone: '99 99999 9999'
        )
      end
      let(:new_lead_with_nil_email) do
        Leads::Entities::Lead.new(
          email: nil,
          name: 'Foo',
          phone: '99 99999 9999'
        )
      end

      it 'presents error when email empty' do
        expect(presenter).to receive(:present_error).with(:empty_email)

        usecase.run(new_lead_with_empty_email)
      end

      it 'presents error when email is nil' do
        expect(presenter).to receive(:present_error).with(:empty_email)

        usecase.run(new_lead_with_nil_email)
      end
    end
  end
end
