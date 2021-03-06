$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kiq_bus/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kiq_bus"
  s.version     = KiqBus::VERSION
  s.authors     = ["aquinofb"]
  s.email       = ["aquinofb@gmail.com"]
  s.homepage    = "https://github.com/aquinofb/kiqbus"
  s.summary     = "A simple pubsub for decoupled Rails event based applications."
  s.description = "Provides support for decoupled Rails event based applications."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4"

  s.add_development_dependency "sidekiq", "~> 4"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "pry"
end
