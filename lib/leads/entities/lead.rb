module Leads
  module Entities
    class Lead
      attr_reader :id, :email, :name, :phone

      def initialize(id: nil, email:, name:, phone:)
        @id = id
        @email = email
        @name = name
        @phone = phone
      end
    end
  end
end
