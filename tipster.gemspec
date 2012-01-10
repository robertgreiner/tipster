# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tipster/version"

Gem::Specification.new do |s|
  s.name        = "tipster"
  s.version     = Tipster::VERSION
  s.authors     = ["Robert Greiner", "Neelima Sriramula"]
  s.email       = ["robert@robertgreiner.com"]
  s.homepage    = "http://creatingcode.com/quality"
  s.summary     = %q{Code risk identification and mitigation tool}
  s.description = %q{Tipster attempts to assess the risk of your most recent Git commit by applying various code heuristics that have indicated a high probability of introducing defects.}
  s.rubyforge_project = "tipster"
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-given"
  s.add_development_dependency "wrong"
  s.add_runtime_dependency "launchy"
end
