Gem::Specification.new do |gem|
  gem.name        = "jaccard"
  gem.version     = "1.0.0"
  gem.summary     = %Q{A library to make calculating the Jaccard Coefficient Index a snap}
  gem.description = %Q{The Jaccard Coefficient Index is a measure of how similar two sets are. This library makes calculating the coefficient very easy, and provides useful helpers.}
  gem.email       = "francois@teksol.info"
  gem.homepage    = "http://github.com/francois/jaccard"
  gem.authors     = ["François Beausoleil"]

  gem.add_development_dependency "rspec", ">= 1.2.9"
  gem.add_development_dependency "yard", ">= 0"
end
