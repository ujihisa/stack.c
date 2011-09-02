require 'dl/import'
require 'forwardable'

module LibStack
  module Import
    extend DL::Importer
    libstack_so = Dir.glob(File.expand_path("../../libstack.{dll,dylib,so}", __FILE__))[0]
    unless libstack_so
      raise "unable to find the shared library for testing"
    end
    dlload libstack_so

    Stack = struct [
      'int* root',
      'int  i',
      'int  size',
    ]
    extern 'void* newstack(int)'
    extern 'void deletestack(void*)'
    extern 'void debug_printstack(void*)'
    extern 'int pop(void*)'
    extern 'void push(void*, int)'
  end

  Stack = Import::Stack

  extend Forwardable

  def self.newstack(size)
    ptr = Import.newstack(size)
    Stack.new(ptr)
  end

  def_delegator Import, :deletestack
  def_delegator Import, :debug_printstack
  def_delegator Import, :pop
  def_delegator Import, :push
end
