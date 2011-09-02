require 'rspec/core/rake_task'

case RUBY_PLATFORM
when /mswin/, /mingw/, /cygwin/
  DL_EXT = '.dll'
  OBJ_EXT = '.obj'
when /darwin/
  DL_EXT = '.dylib'
end

DL_EXT ||= '.so'
OBJ_EXT ||= '.o'

SOURCES = [ 'stack.c', 'main.c' ]
OBJECTS = SOURCES.map {|x| x.sub(/\.c$/, OBJ_EXT) }

LIBSTACK_SO = 'libstack' + DL_EXT

rule OBJ_EXT => [ '.c' ] do |t|
  sh "clang -fPIC -o #{t.name} -c #{t.source}"
end

file 'main' => OBJECTS do |t|
  sh "clang -o #{t.name} #{t.prerequisites.join(' ')}"
end

task default: 'main' do
  sh './main'
end

file LIBSTACK_SO => OBJECTS do |t|
  sh "clang -shared -o #{t.name} #{t.prerequisites.join(' ')}"
end

task shared: LIBSTACK_SO

task :clean do
  sh "rm -f main #{LIBSTACK_SO} #{OBJECTS.join(' ')}"
end

task spec: :shared
RSpec::Core::RakeTask.new :spec do |t|
  t.rspec_opts = %w[--color]
end
