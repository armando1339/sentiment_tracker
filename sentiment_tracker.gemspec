$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "sentiment_tracker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "sentiment_tracker"
  spec.version     = SentimentTracker::VERSION
  spec.authors     = ["Armando Alejandre"]
  spec.email       = ["armando1339@gmail.com"]
  spec.homepage    = "https://github.com/armando1339"
  spec.summary     = "SentimentTracker is a plugin Rails for keep track of sentiment analysis process."
  spec.description = "Plugin Rails for keep track of sentiment analysis process"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.4"
  spec.add_dependency "jbuilder", "~> 2.10", ">= 2.10.1"
  spec.add_dependency "light-service", "~> 0.15.0"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "pg"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "shoulda-matchers"
  spec.add_development_dependency "shoulda-callback-matchers"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "pry-rails"
end
