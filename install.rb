require "fileutils"
FileUtils.mkdir_p "pkg"

require_relative "lib/rumbo"
version = Rumbo::VERSION
commands = [
  "gem uninstall -I rumbo",
  "rm pkg/*.gem",
  "gem build rumbo.gemspec -o pkg/rumbo-#{version}.gem",
  "gem install pkg/rumbo-#{version}.gem",
]

commands.each do |command|
  puts command
  %x{#{command}}
end
