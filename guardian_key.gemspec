require "#{File.dirname(__FILE__)}/lib/version"

Gem::Specification.new do |spec|
  spec.name        = 'guardian_key'
  spec.version     = GUARDIAN_KEY_VERSION
  spec.summary     = 'Guardian Key API Integration'
  spec.description = 'This library provides developers with a simple set of bindings to help you integrate the Guardian Key API into a website and make the authentication process more secure.'
  spec.authors     = ['Eduardo Azevedo']
  spec.email       = 'eduardoazevedo3@gmail.com'
  spec.files       = ['lib/guardian_key.rb']
  spec.homepage    = 'https://rubygems.org/gems/guardian_key'
  spec.license     = 'MIT'

  spec.require_paths = %w[lib]

  spec.add_dependency 'json'
end
