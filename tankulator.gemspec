lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tankulator/version'

Gem::Specification.new do |s|
	s.name = 'tankulator'
	s.summary = 'Simple splitting of gas tank fills'
	s.description = 'A simple(ish) tool for splitting tanks of gas between multiple drivers'
	s.author = 'Adam Kerney'
	s.email = 'opensource@adamwk.com'
	s.license = 'MIT'
	s.version = Tankulator::VERSION
	s.executables << "tankulator"
	s.bindir = "bin"
	s.date = %q{2014-04-24}
	s.homepage = 'https://github.com/awkerney/tanker'
	s.files = Dir["{lib}/**/*.rb"]
	s.require_path = "lib"
	s.add_runtime_dependency "mercenary", "~> 0.3"
end
