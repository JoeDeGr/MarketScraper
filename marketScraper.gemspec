
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "marketScraper/version"

Gem::Specification.new do |spec|
  spec.name          = "marketScraper"
  spec.version       = MarketScraper::VERSION
  spec.authors       = ["'Joseph DeGregorio'"]
  spec.email         = ["'degregorio.joseph@gmail.com'"]

  spec.summary       = %q{"A gem that tetrieves market data on a given stock and adds it to a portfolio".}
  spec.description   = %q{"The Gem Retrieves data from Yahoo Finance on a given stock symbol and adds the given number of shares adds the value to a portfolio of stocks."}
  spec.homepage      = https://github.com/JoeDeGr/MarketScraper.git
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = https://github.com/JoeDeGr/MarketScraper.git
    spec.metadata["changelog_uri"] = https://github.com/JoeDeGr/MarketScraper.git
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end

