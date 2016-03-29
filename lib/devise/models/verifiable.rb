module Devise
  module Models
    # Verifiable is responsible to add a second step to user sign up process.
    # This module is used when extra information is needed at sign up, e.g.
    # full name, address, documents, etc. Since this adds a second step, the
    # user will be able to finish the registration afterwards.
    #
    #
    # == Options
    #
    # Verifiable adds the following options to +devise+:
    #
    #   * +fields_for_verification+: A list of fields which have to be filled
    #     in the second step of the registration process by the user. These
    #     fields will be used to build the form in the second screen.
    #
    # == Examples
    #
    #   User.find(1).verified?   # true/false
    #
    module Verifiable
      extend ActiveSupport::Concern

      def self.required_fields(klass)
        klass.fields_for_verification
      end

      # Determine if the user filled the fields required in the second sign up
      # step
      def verified?
        self.class.fields_for_verification.all? { |field| send("#{field}?") }
      end

      module ClassMethods
        Devise::Models.config(self, :fields_for_verification)
      end
    end
  end
end


