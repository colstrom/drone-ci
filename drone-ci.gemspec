# frozen_string_literal: true

Gem::Specification.new do |gem|
  gem.name          = 'drone-ci'
  gem.homepage      = 'https://github.com/colstrom/drone-ci'
  gem.summary       = 'Ruby Interface to the Drone CI API'

  gem.licenses      = ['MIT']
  gem.authors       = ['Chris Olstrom']
  gem.email         = 'chris@olstrom.com'

  # gem.cert_chain    = ['trust/certificates/colstrom.pem']
  # gem.signing_key   = File.expand_path ENV.fetch 'GEM_SIGNING_KEY'

  if ENV['HACKING']
    gem.version     = '0.0.0'
    gem.files       = Dir.glob('**')
    gem.executables = Dir.glob('bin/*')
  else
    gem.required_ruby_version = '>= 3.0.0'
    gem.version               = `git describe --tags --always`.chomp
    gem.files                 = `git ls-files -z`.split("\x0")
    gem.executables           = `git ls-files -z -- bin/*`.split("\x0").map { |f| File.basename(f) }
  end

  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'faraday',        '~> 2.5', '>= 2.5.2'
  gem.add_runtime_dependency 'faraday-retry',  '~> 2.0'
  gem.add_runtime_dependency 'httpx',          '>= 0.21', '< 0.23'
  gem.add_runtime_dependency 'octokit',        '~> 5.6'

  gem.add_development_dependency 'pry',        '~> 0.14.1'
  gem.add_development_dependency 'pry-doc',    '~> 1.3'
  gem.add_development_dependency 'rubocop',    '~> 1.35'
  gem.add_development_dependency 'solargraph', '~> 0.46.0'
  gem.add_development_dependency 'yard',       '~> 0.9.28'
  gem.metadata['rubygems_mfa_required'] = 'true'
end
