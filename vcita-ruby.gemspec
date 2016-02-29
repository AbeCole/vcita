$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "vcita/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vcita-ruby"
  s.version     = Vcita::VERSION
  s.authors     = ["AbeCole"]
  s.email       = ["me@abecole.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Vcita-ruby."
  s.description = "TODO: Description of Vcita-ruby."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 5.0.0.beta3", "< 5.1"

  s.add_development_dependency "sqlite3"
end
