#!/usr/bin/env rake
$:.push File.expand_path("../lib", __FILE__)
require 'action_mailer'
require 'exception_log'

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

task :build do
  system "gem build exception_log.gemspec"
end

task :install => :build do
  system "gem install exception_log-#{ExceptionLog::VERSION}.gem"
end

task :release => :build do
  puts "Tagging #{ExceptionLog::VERSION}..."
  system "git tag -a #{ExceptionLog::VERSION} -m 'Tagging #{ExceptionLog::VERSION}'"
  puts "Pushing to Github..."
  system "git push --tags"
  puts "Pushing to rubygems.org..."
  system "gem push exception_log-#{ExceptionLog::VERSION}.gem"
end
