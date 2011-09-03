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

SOURCES = ['stack.c', 'main.c']
OBJECTS = SOURCES.map {|x| x.sub(/\.c$/, OBJ_EXT) }

LIBSTACK_SOURCES = SOURCES - ['main.c']
LIBSTACK_OBJECTS = LIBSTACK_SOURCES.map {|x| x.sub(/\.c$/, OBJ_EXT) }

LIBSTACK_SO = 'libstack' << DL_EXT

rule OBJ_EXT => ['.c'] do |t|
  sh "clang -fPIC -o #{t.name} -c #{t.source}"
end

desc 'builds main command'
file 'main' => OBJECTS do |t|
  sh "clang -o #{t.name} #{t.prerequisites.join(' ')}"
end

desc 'runs main command after building it'
task default: 'main' do
  sh './main'
end

file LIBSTACK_SO => LIBSTACK_OBJECTS do |t|
  sh "clang -shared -o #{t.name} #{t.prerequisites.join(' ')}"
end

desc "builds #{LIBSTACK_SO}"
task shared: LIBSTACK_SO

desc 'good bye generated files'
task :clean do
  sh "rm -f main #{LIBSTACK_SO} #{OBJECTS.join(' ')}"
end

desc 'runs spec'
task spec: :shared
RSpec::Core::RakeTask.new :spec do |t|
  t.rspec_opts = %w[--color]
end
