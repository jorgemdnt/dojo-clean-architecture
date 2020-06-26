require 'rails_helper'
require 'leads/entities/lead'

RSpec.describe Leads::CreateLeadPresenter do
  let(:presenter) { described_class.new }

  describe '#make_response' do
    context 'when error presented' do
      it 'returns http status 400' do
        presenter.present_error(:empty_email)

        response = presenter.make_response

        expect(response[:status]).to eq(:bad_request)
      end

      it 'returns body with type error' do
        presenter.present_error(:empty_email)

        response = presenter.make_response

        expect(response[:body][:type]).to eq(:empty_email)
      end

      it 'returns body with message error' do
        presenter.present_error(:empty_email)

        response = presenter.make_response

        expect(response[:body][:message]).to eq('Invalid e-mail.')
      end
    end

    context 'when lead created' do
      let(:created_lead) do
        Leads::Entities::Lead.new(
          id: 1,
          email: 'example@example.com',
          name: 'Foo',
          phone: '99 99999 9999'
        )
      end

      before do
        presenter.created_with_success(created_lead)

      end

      it 'returns http status 201' do
        response = presenter.make_response
        expect(response[:status]).to eq(:created)
      end

      it 'returns created lead in body' do
        response = presenter.make_response
        expect(response[:body])
          .to have_attributes(
            id: 1,
            email: 'example@example.com',
            name: 'Foo',
            phone: '99 99999 9999'
        )
      end
    end
  end
end
