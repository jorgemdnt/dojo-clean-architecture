require 'rails_helper'



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
      
    end
  end
end