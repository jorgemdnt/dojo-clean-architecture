module Leads
  module Usecases
    class CreateLeadUsecase
      def initialize(lead_gateway, create_lead_presenter)
        @lead_gateway = lead_gateway
        @presenter = create_lead_presenter
      end

      def run(new_lead_entity)
        unless new_lead_entity.valid_email?
          @presenter.present_error(:empty_email)
          return
        end

        created_lead = @lead_gateway.create_lead(new_lead_entity)
        @presenter.created_with_success(created_lead)
      end
    end
  end
end
