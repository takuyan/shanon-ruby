lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shanon/version'

Gem::Specification.new do |spec|
  spec.name          = 'shanon'
  spec.version       = Shanon::VERSION
  spec.authors       = ['Takuya Kato']
  spec.email         = ['g@takuyan.com']

  spec.summary       = %q{Client for accessing Shanon Marketing Platform APIs}
  spec.description   = %q{Client for accessing Shanon Marketing Platform APIs}
  spec.homepage      = 'https://github.com/takuyan/shanon-api-ruby-client'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday'
  spec.add_dependency 'ox'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'test-unit'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'pry-byebug'
end
