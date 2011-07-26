# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'has_many_polymorphic/version'

Gem::Specification.new do |s|
  s.name = %q{has_many_polymorphic}
  s.version = ::HasManyPolymorphic::VERSION
  s.authors = ["Russell Holmes"]
  s.description = %q{Simple replacement for has_many_polymorphs}
  s.email = %q{rholmes@tnsolutionsinc.com}
  s.files = Dir.glob("lib/**/*") + %w(MIT-LICENSE.txt README.rdoc)
  s.homepage = %q{https://github.com/russ1985/has_many_polymorphic}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Simple replacement for has_many_polymorphs}
  s.add_runtime_dependency 'activerecord', '>= 2.3.5'
end