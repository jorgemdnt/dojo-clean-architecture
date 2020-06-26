require 'rails_helper'

RSpec.describe Leads::LeadGateway do
  let(:gateway) { described_class.new }

  describe '#create_lead' do
    context 'when received entity' do
      let(:new_lead_entity) { }

      it 'should created lead' do
        gateway.create_lead()
      end
    end
  end
end
