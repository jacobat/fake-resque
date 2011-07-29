# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fake-resque/version"

Gem::Specification.new do |s|
  s.name        = "fake-resque"
  s.version     = FakeResque::Version
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jacon Atzen"]
  s.email       = ["jacob@incremental.dk"]
  s.homepage    = "http://github.com/jacobat/fake-resque"
  s.summary     = %q{A fake resque. Use it in your tests.}
  s.description = %q{A fake resque. Use it in your tests.}

  s.rubyforge_project = "fake-resque"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
