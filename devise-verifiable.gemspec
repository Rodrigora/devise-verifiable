$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devise/verifiable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devise-verifiable"
  s.version     = Devise::Verifiable::VERSION
  s.authors     = ["Rodrigo Ra"]
  s.email       = ["rodrigorcomp@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of DeviseVerifiable."
  s.description = "TODO: Description of DeviseVerifiable."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"
  s.add_dependency "devise", "~> 3.5.0"

  s.add_development_dependency "sqlite3"
end
