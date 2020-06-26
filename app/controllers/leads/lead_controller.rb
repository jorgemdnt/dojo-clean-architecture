require 'leads/usecases/create_lead_usecase'

module Leads
  class LeadController < ApplicationController
    def create
      use_case = Leads::Usecases::CreateLeadUsecase.new(lead_gateway, create_lead_presenter)
    end
  end
end
