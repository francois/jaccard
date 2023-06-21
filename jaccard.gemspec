Gem::Specification.new do |gem|
  gem.name = "jaccard"
  gem.version = "1.1.1"
  gem.summary = %(A library to make calculating the Jaccard Coefficient Index a snap)
  gem.description = %(The Jaccard Coefficient Index is a measure of how similar two sets are. This library makes calculating the coefficient very easy, and provides useful helpers.)
  gem.email = "francois@teksol.info"
  gem.homepage = "http://github.com/francois/jaccard"
  gem.authors = ["François Beausoleil"]
  gem.files = Dir["bin/*"] + Dir["lib/**/*.rb"] << "README.md" << "LICENSE" << "Gemfile"
  gem.licenses = "MIT"

  gem.add_development_dependency "rake", ">= 13.0.6", "< 14.0"
  gem.add_development_dependency "rspec", ">= 1.2.9", "< 4.0"
  gem.add_development_dependency "standardrb", ">= 1.0.1", "< 2.0"
  gem.add_development_dependency "yard", ">= 0.9.34", "< 1.0"
end
