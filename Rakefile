require 'rubygems'
Gem::manage_gems

require 'rake/gempackagetask'
require 'lib/version'

spec = Gem::Specification.new do |s|
  s.platform  =   Gem::Platform::RUBY
  s.name = "ronin"
  s.version = Ronin::RONIN_VERSION
  s.author = "Postmodern Modulus III"
  s.email = "postmodern@users.sourceforge.net"
  s.summary = "A decentralized security platform designed to promote the distribution of information security tools and information"
  s.files = FileList['lib/*.rb', 'bin/*'].to_a
  s.require_path = "lib"
  s.autorequire = "ronin"
  s.has_rdoc = false
  s.executables << 'ronin'

  s.add_dependency('og')
  s.add_dependency('hpricot')
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end

task :default => "pkg/#{spec.name}-#{spec.version}.gem" do
  puts "generated latest version"
end
