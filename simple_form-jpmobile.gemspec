# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "simple_form-jpmobile/version"

Gem::Specification.new do |s|
  s.name        = "simple_form-jpmobile"
  s.version     = SimpleForm::Jpmobile::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["TODO: Write your name"]
  s.email       = ["TODO: Write your email address"]
  s.homepage    = ""
  s.summary     = %q{SimpleForm and Jpmobile integration}
  s.description = %q{Keitai numeric imput modes on SimpleForm}

  s.rubyforge_project = "simple_form-jpmobile"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "simple_form", "~> 1.3.1"
  s.add_dependency "jpmobile"
end
