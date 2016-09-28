# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
# lib = File.expand_path('../lib', __FILE__)

# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'staker/version'

Gem::Specification.new do |spec|
  spec.name          = "staker"
  spec.version       = Staker::VERSION
  spec.authors       = ["santhums"]
  spec.email         = ["santhu@7nodes.com"]

  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  # end

  spec.summary       = %q{Staker is helper class for searching over stalkoverflow.}
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = [".gitignore", "CODE_OF_CONDUCT.md", "Gemfile", "LICENSE.txt", "README.md", "Rakefile", "bin/console", "bin/setup", "lib/staker.rb", "lib/staker/version.rb", "staker.gemspec", "lib/staker/stak_over_flow.rb"]
  # spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }.push("lib/staker/stak_over_flow.rb")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'nokogiri'
  spec.add_dependency 'launchy'

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'

  # spec.add_runtime_dependency 'savon'
end
