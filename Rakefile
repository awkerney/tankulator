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
	sh "gem install ./#{gem_file}"
end

task :clean do
	sh "rm -f #{gem_file}"
end

task :uninstall do
	sh "gem uninstall -x tankulator"
end

task rebuild: [:uninstall, :clean, :build]
