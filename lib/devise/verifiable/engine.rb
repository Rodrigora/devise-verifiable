module Devise
  module Verifiable
    class Engine < ::Rails::Engine
      isolate_namespace Devise::Verifiable
    end
  end
end
