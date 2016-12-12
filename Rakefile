require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :compile

require 'ffi'

task default: :compile

desc 'Compile drafter'
task :compile do
  prefix = FFI::Platform.mac? ? '' : 'lib.target/'
  path = File.expand_path("ext/drafter/build/out/Release/#{prefix}libdrafter.#{FFI::Platform::LIBSUFFIX}", File.dirname(__FILE__))
  puts "Path to the compiled drafter library: #{path}"
  if !File.exist?(path) || ENV['RECOMPILE']
    puts 'The library does not exist, lets compile it'
    unless File.directory?(File.expand_path('ext/drafter/ext/snowcrash/src'))
      puts 'Initializing submodules as they are not checked out...'
      `git submodule update --init --recursive`
    end
    puts 'Compiling...'
    `cd #{File.expand_path('ext/drafter/')} && ./configure --shared && make drafter`
    status = $CHILD_STATUS.to_i
    if status == 0
      puts 'Compiling done.'
    else
      raise 'Compiling error, exiting.'
    end
  else
    puts 'Extension already compiled. To recompile set env variable RECOMPILE=true.'
  end
end
