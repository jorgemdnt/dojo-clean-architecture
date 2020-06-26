require 'spec_helper'
require 'leads/entities/lead'

RSpec.describe Leads::Entities::Lead do
  let(:lead) { described_class.new(email: email) }

  context 'when email is valid' do
    let(:email) { 'example@org' }

    it 'returns true' do
      expect(lead.valid_email?).to be_truthy
    end
  end

  context 'when email is empty' do
    let(:email) { '' }

    it 'returns false' do
      expect(lead.valid_email?).to be_falsy
    end
  end

  context 'when email is null' do
    let(:email) { nil }

    it 'returns false' do
      expect(lead.valid_email?).to be_falsy
    end
  end

end
