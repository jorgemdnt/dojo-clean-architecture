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

    def make_response
      {
        status: @http_status,
        body: @body
      }
    end
  end
end