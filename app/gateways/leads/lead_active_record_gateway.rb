module Leads
  class LeadActiveRecordGateway
    def create_lead(new_lead)
      Leads::LeadModel.create(email: new_lead.email, name: new_lead.name, phone: new_lead.phone)
    end
  end
end
