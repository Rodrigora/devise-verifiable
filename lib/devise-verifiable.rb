require 'devise'
require "devise/verifiable/engine"

module Devise
  autoload :Verifiable, 'devise/verifiable'

  mattr_accessor :fields_for_verification
  @@fields_for_verification = []
end

Devise.add_module :verifiable, model: 'devise/models/verifiable'
