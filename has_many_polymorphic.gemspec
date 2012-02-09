# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'has_many_polymorphic/version'

Gem::Specification.new do |s|
  s.name = %q{has_many_polymorphic}
  s.version = ::HasManyPolymorphic::VERSION
  s.authors = ["Russell Holmes"]
  s.description = %q{Simple replacement for has_many_polymorphs}
  s.email = %q{russonrails@gmail.com}
  s.files = Dir["{lib,spec}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.homepage = %q{https://github.com/russ1985/has_many_polymorphic}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Simple replacement for has_many_polymorphs}
  
  s.add_dependency 'rails', ">= 3.0"
  s.add_dependency "rspec-rails", "~> 2.7"
  s.add_dependency "sqlite3", "~> 1.3.4"
  s.add_dependency "simplecov", "~> 0.5"
end