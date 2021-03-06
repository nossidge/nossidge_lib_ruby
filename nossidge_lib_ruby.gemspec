# Encoding: UTF-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'nossidge_lib_ruby'
  s.authors       = ['Paul Thompson']
  s.email         = ['nossidge@gmail.com']

  s.summary       = %q{Miscellaneous Ruby code}
  s.description   = %q{Stuff that I'm still working on.}
  s.homepage      = 'https://github.com/nossidge/nossidge_lib_ruby'

  s.version       = '0.0.0'
  s.date          = '2017-07-01'
  s.license       = 'GPL-3.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency('bundler', '~> 1.13')
  s.add_development_dependency('rake',    '~> 10.0')
  s.add_development_dependency('rspec',   '~> 3.0')
end
