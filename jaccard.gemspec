Gem::Specification.new do |gem|
  gem.name = "jaccard"
  gem.version = "1.0.2"
  gem.summary = %(A library to make calculating the Jaccard Coefficient Index a snap)
  gem.description = %(The Jaccard Coefficient Index is a measure of how similar two sets are. This library makes calculating the coefficient very easy, and provides useful helpers.)
  gem.email = "francois@teksol.info"
  gem.homepage = "http://github.com/francois/jaccard"
  gem.authors = ["François Beausoleil"]
  gem.files = Dir["bin/*"] + Dir["lib/**/*.rb"] << "README.md" << "LICENSE" << "Gemfile"

  gem.add_development_dependency "rake", ">= 0"
  gem.add_development_dependency "rspec", ">= 1.2.9"
  gem.add_development_dependency "standardrb", ">= 0"
  gem.add_development_dependency "yard", ">= 0"
end
