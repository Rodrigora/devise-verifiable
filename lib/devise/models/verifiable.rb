module Devise
  module Models
    module Verifiable
      extend ActiveSupport::Concern

      def self.required_fields(klass)
        klass.fields_for_verification
      end

      module ClassMethods
        Devise::Models.config(self, :fields_for_verification)
      end
    end
  end
end


