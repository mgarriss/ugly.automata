$:.unshift File.join( File.dirname( __FILE__ ))
$:.unshift File.join( File.dirname( __FILE__ ), 'lib')

require 'rake'
require 'rake/testtask'
require 'automata/version'

Rake::TestTask.new(:test) do |t|
  t.libs << "spec"
  t.test_files = FileList["spec/**/*_spec.rb"]
  t.verbose = true
end

task :build do
  system "gem build ../gemspecs/ugly.automata.gemspec"
  system "mv ugly.automata-#{Automata::VERSION}.gem ../gems"
end
 
task :local => :build do
  system "gem install ../gems/ugly.automata-#{Automata::VERSION}.gem"
end

task :release => :build do
  system "gem push ../gems/ugly.automata-#{Automata::VERSION}.gem"
end

task :default => [:test]
