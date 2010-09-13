Gem::Specification.new do |gem|
  gem.name    = 'andy_admin'
  gem.version = '0.0.4'
  gem.summary = 'A generator for a nice admin style'
  gem.author = "Andy Jeffries"
  gem.description = 'A generator for a nice admin style, like many other popular Rails-based sites'
  gem.email = "andy@andyjeffries.co.uk"
  gem.homepage = "http://andyjeffries.co.uk"

  gem.files = Dir['lib/**/*']
  gem.add_dependency 'rails', '~>3.0'
end
