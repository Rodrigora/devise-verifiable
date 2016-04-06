module Devise
  module Verifiable
    module Controller
      module Helpers
        extend ActiveSupport::Concern

        def self.define_helpers(mapping)
          mapping = mapping.name

          class_eval <<-METHODS, __FILE__, __LINE__ + 1

            def authenticate_verified_#{mapping}!(opts={})
              authenticate_#{mapping}!
              redirect_to '/users/verify' unless current_#{mapping}.verified?
            end

          METHODS
        end
      end
    end
  end
end
