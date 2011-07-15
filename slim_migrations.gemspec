# -*- encoding: utf-8 -*-
require 'rubygems' unless defined? Gem
require File.dirname(__FILE__) + '/lib/slim_migrations/version'

Gem::Specification.new do |s|
  s.name = 'slim_migrations'
  s.summary = 'Let\'s you write even slimmer migrations.'
  s.description = 'Let\'s you write even slimmer migrations.'
  s.author = 'Jan Lelis'
  s.email = 'mail@janlelis.de'
  s.homepage = 'https://github.com/janlelis/slim_migrations'
  s.files = Dir['lib/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.version = SlimMigrations::VERSION
  s.add_dependency 'rails', '~> 3.1.0.rc4'
end
