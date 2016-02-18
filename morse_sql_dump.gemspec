$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "morse_sql_dump/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "morse_sql_dump"
  s.version     = MorseSqlDump::VERSION
  s.authors     = ["fred mcgroarty"]
  s.email       = ["mcfremac@icloud.com"]
  s.homepage    = "https://github.com/morsedigital/morse_sql_dump"
  s.summary     = "Mysql Dumper"
  s.description = "Morse Gem for exporting a snapshot of mysql db's. To be used ONLY in the Klingon afterlife, Stovokor."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_development_dependency "bundler", "~> 1.8"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency 'rspec-rails', '~> 3.4.2'
  s.add_development_dependency 'sqlite3', '~> 1.3.11'


end
