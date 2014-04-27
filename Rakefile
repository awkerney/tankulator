$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), *%w[lib]))
require 'tankulator/version'

def version
  Tankulator::VERSION
end

def gemspec_file
  "tankulator.gemspec"
end

def gem_file
  "tankulator-#{version}.gem"
end

task :default => [:build]

task :build do
	sh "gem build tankulator.gemspec"
	puts "Would run sh \"gem install ./#{gem_file}\" "
end

task :clean do
	sh "rm #{gem_file}"
end