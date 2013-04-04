# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "exception_log"
  s.version     = "0.1.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["wxianfeng"]
  s.email       = ["wang.fl1429@gmail.com"]
  s.homepage    = "http://github.com/wxianfeng/exception_log"
  s.summary     = "rails exception send to email, and watch in web ui interface"
  s.description = ""

  s.required_rubygems_version = ">= 1.3.6"
  # s.add_development_dependency("rspec")

  s.files         = Dir['README.md', 'VERSION', 'LICENSE.txt', 'Rakefile', 'lib/**/*']
  # s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ["lib"]
end
