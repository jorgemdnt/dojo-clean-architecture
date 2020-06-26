require 'leads/usecases/create_lead_usecase'

module Leads
  class LeadController < ApplicationController
    def create
      lead_gateway = Leads::LeadActiveRecordGateway.new
      create_lead_presenter = Leads::CreateLeadPresenter.new
      use_case = Leads::Usecases::CreateLeadUsecase.new(lead_gateway, create_lead_presenter)
      new_lead = Entities::Lead.new(name: params[:name], email: params[:email], phone: params[:phone])
      use_case.run(new_lead)
      render create_lead_presenter.make_response
    end
  end
end
