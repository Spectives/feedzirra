# -*- encoding: utf-8 -*-
require 'rubygems'
require 'rake'

Gem::Specification.new do |s|
  s.name = %q{feedzirra}
  s.version = "0.0.20"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Paul Dix"]
  s.date = %q{2009-02-19}
  s.email = %q{paul@pauldix.net}
  s.files = FileList.new('lib/*.rb', 'lib/**/*.rb', 'README.rdoc', 'README.textile', 'Rakefile', 'spec/**/*.rb', 'spec/*.rb')
  s.has_rdoc = true
  s.homepage = %q{http://github.com/pauldix/feedzirra}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A feed fetching and parsing library that treats the internet like Godzilla treats Japan: it dominates and eats all.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, ["> 0.0.0"])
      s.add_runtime_dependency(%q<pauldix-sax-machine>, [">= 0.0.12"])
      s.add_runtime_dependency(%q<taf2-curb>, [">= 0.2.3"])
      s.add_runtime_dependency(%q<builder>, [">= 2.1.2"])
      s.add_runtime_dependency(%q<activesupport>, [">=2.0.0"])
      s.add_runtime_dependency(%q<mdalessio-dryopteris>, [">= 0.0.0"])
    else
      s.add_dependency(%q<nokogiri>, ["> 0.0.0"])
      s.add_dependency(%q<pauldix-sax-machine>, [">= 0.0.12"])
      s.add_dependency(%q<taf2-curb>, [">= 0.2.3"])
      s.add_dependency(%q<builder>, [">= 2.1.2"])
      s.add_dependency(%q<activesupport>, [">=2.0.0"])
      s.add_dependency(%q<mdalessio-dryopteris>, [">= 0.0.0"])
    end
  else
    s.add_dependency(%q<nokogiri>, ["> 0.0.0"])
    s.add_dependency(%q<pauldix-sax-machine>, [">= 0.0.12"])
    s.add_dependency(%q<taf2-curb>, [">= 0.2.3"])
    s.add_dependency(%q<builder>, [">= 2.1.2"])
    s.add_dependency(%q<activesupport>, [">=2.0.0"])
    s.add_dependency(%q<mdalessio-dryopteris>, [">= 0.0.0"])
  end
end
