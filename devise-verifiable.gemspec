$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'devise/verifiable/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'devise-verifiable'
  s.version     = Devise::Verifiable::VERSION
  s.authors     = ['Rodrigo Ra']
  s.email       = ['rodrigorcomp@gmail.com']
  s.homepage    = 'http://github.com/Rodrigora/devise-verifiable'
  s.summary     = 'DeviseVerifiable adds a second step to Devise\'s signup process'
  s.description = 'DeviseVerifiable is a Devise extension which adds a second step to sign up process'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']
  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency 'devise', '~> 4.4'

  s.add_development_dependency 'sqlite3', '~> 1.3'
  s.add_development_dependency 'capybara', '~> 3.0'
end
