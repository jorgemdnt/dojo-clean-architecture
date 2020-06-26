module Leads
  class CreateLeadPresenter
    def initialize
      @http_status = nil
      @body = {}
    end

    def present_error(error)
      @http_status = :bad_request
      @body = {
        type: error,
        message: 'Invalid e-mail.'
      }
    end

    def created_with_success(created_lead)
      @http_status = :created
      @body = {
        email: created_lead.email,
        id: created_lead.id,
        name: created_lead.name,
        phone: created_lead.phone
      }
    end

    def make_response
      {
        status: @http_status,
        json: @body
      }
    end
  end
end
