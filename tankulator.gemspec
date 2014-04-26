Gem::Specification.new do |s|
	s.name = 'tankulator'
	s.version = '0.0.1'
	s.default_executable = "tankulator"
	s.date = %q{2014-04-24}
	s.summary = 'Simple splitting of tank fills'
	s.description = 'A simple(ish) tool for splitting tanks of gas between multiple drivers'
	s.author = 'Adam Kerney'
	s.homepage = 'https://github.com/awkerney/tanker'
	s.files = Dir["{lib}/**/*.rb", "bin/*"]
	s.require_path = "lib"
end
