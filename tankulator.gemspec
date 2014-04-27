lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tankulator/version'

Gem::Specification.new do |s|
	s.name = 'tankulator'
	s.license = 'MIT'
	s.version = Tankulator::VERSION
	s.default_executable = "tankulator"
	s.executables << "tankulator"
	s.date = %q{2014-04-24}
	s.summary = 'Simple splitting of tank fills'
	s.description = 'A simple(ish) tool for splitting tanks of gas between multiple drivers'
	s.author = 'Adam Kerney'
	s.email = 'opensource@adamwk.com'
	s.homepage = 'https://github.com/awkerney/tanker'
	s.files = Dir["{lib}/**/*.rb", "bin/*"]
	s.require_path = "lib"
end
