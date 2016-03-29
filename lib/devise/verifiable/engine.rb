module Devise
  module Verifiable
    class Engine < ::Rails::Engine
      isolate_namespace Devise::Verifiable

      ActiveSupport.on_load(:action_controller) do
        include Devise::Verifiable::Controller::Helpers
      end

    end
  end
end
