module Leads
  module Entities
    class Lead
      attr_reader :id, :email, :name, :phone

      def initialize(id: nil, email:, name: nil, phone: nil)
        @id = id
        @email = email
        @name = name
        @phone = phone
      end

      def valid_email?
        email != nil && email != ''
      end
    end
  end
end
