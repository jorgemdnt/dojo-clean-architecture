module Leads
  module Usecases
    class CreateLeadUsecase

      def initialize(lead_gateway)
        @lead_gateway = lead_gateway
      end

      def run(new_lead_entity)
        @lead_gateway.create_lead(new_lead_entity)
      end
    end
  end
end
