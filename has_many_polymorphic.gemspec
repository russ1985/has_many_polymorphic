# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'has_many_polymorphic/version'

Gem::Specification.new do |s|
  s.name = %q{has_many_polymorphic}
  s.version = HasManyPolymorphic::VERSION::STRING
  s.authors = ["Russell Holmes"]
  s.description = %q{Simple replacement for has_many_polymorphs}
  s.email = %q{russonrails@gmail.com}
  s.files = Dir["{lib,spec}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.homepage = %q{https://github.com/russ1985/has_many_polymorphic}
  s.require_paths = ["lib"]
  s.summary = %q{Simple replacement for has_many_polymorphs}
  
  s.add_dependency 'rails', "<= 5.3"
  s.add_dependency "rspec-rails", "~> 3.7.2"
  s.add_dependency "simplecov", "~> 0.15.1"
  
  if RUBY_PLATFORM == 'java'
    s.add_dependency "jdbc-sqlite3"
  else
    s.add_dependency "sqlite3"
  end

end