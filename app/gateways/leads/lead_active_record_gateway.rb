module Leads
  class LeadActiveRecordGateway
    def create_lead(new_lead)
      created_lead = Leads::LeadModel.create(
        email: new_lead.email,
        name: new_lead.name,
        phone: new_lead.phone
      )

      to_entity(created_lead)
    end

    private

    def to_entity(lead_model)
      Leads::Entities::Lead.new(
        id: lead_model.id,
        name: lead_model.name,
        email: lead_model.email,
        phone: lead_model.phone
      )
    end
  end
end
