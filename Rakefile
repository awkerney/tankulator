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
	sh "mkdir pkg > /dev/null"
	sh "mv #{gem_file} pkg/"
end

task :install do
	sh "gem install ./pkg/#{gem_file}"
end
task :clean do
	sh "rm -rf pkg/"
end

task :uninstall do
	sh "gem uninstall -x tankulator"
end

task rebuild: [:uninstall, :clean, :build, :install]
