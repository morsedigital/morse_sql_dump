$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "morse_sql_dump/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "morse_sql_dump"
  s.version     = MorseSqlDump::VERSION
  s.authors     = ["fred mcgroarty"]
  s.email       = ["mcfremac@icloud.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of MorseSqlDump."
  s.description = "TODO: Description of MorseSqlDump."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.5.1"
  s.add_development_dependency "byebug"
  s.add_development_dependency "bundler", "~> 1.8"
  s.add_development_dependency "coveralls", "~> 0.8"
  s.add_development_dependency "guard-rspec", "~> 4.5"
  s.add_development_dependency "rb-fsevent", "~> 0.9"
  s.add_development_dependency "pry-byebug"
  s.add_development_dependency "shoulda-matchers", "~> 2.8"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'


end
