require 'devise'
require "devise/verifiable/routes"
require "devise/verifiable/engine"

module Devise
  module Verifiable
    module Controller
      autoload :Helpers,  'devise/controller/helpers'
    end
  end

  mattr_accessor :fields_for_verification
  @@fields_for_verification = []

  @@helpers << Devise::Verifiable::Controller::Helpers
end

Devise.add_module :verifiable, model: 'devise/models/verifiable',
                               controller: :verifications,
                               route: { verification: [:new, :create] }
