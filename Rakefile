require "rubygems"
require "rake"

task :spec do
  specs = FileList["spec/**/*_spec.rb"]
  sh "rspec --color -I lib #{specs.join(" ")}"
end

task default: :spec

begin
  require "yard"
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end
