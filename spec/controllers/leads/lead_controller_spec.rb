require 'rails_helper'
require 'leads/entities/lead'

RSpec.describe Leads::LeadController do

  describe 'POST #create' do
    before do
      post :create, params: {email: 'example@example.com',
                             name: 'Foo',
                             phone: '99 99999 9999'}
    end

    it 'returns response status 201' do
      expect(response).to have_http_status(201)
    end

    it 'returns response status 201' do
      expect(JSON.parse(response.body)["id"]).to be_kind_of(Integer)
      expect(JSON.parse(response.body)["name"]).to eq('Foo')
      expect(JSON.parse(response.body)["email"]).to eq('example@example.com')
      expect(JSON.parse(response.body)["phone"]).to eq('99 99999 9999')
    end
  end

end
