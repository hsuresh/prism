# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{prism}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Wunsch"]
  s.date = %q{2010-02-24}
  s.default_executable = %q{prism}
  s.description = %q{A Ruby microformat parser and HTML toolkit powered by Nokogiri}
  s.email = ["mark@markwunsch.com"]
  s.executables = ["prism"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".gitignore",
     "Gemfile",
     "Gemfile.lock",
     "LICENSE",
     "README.md",
     "Rakefile",
     "bin/prism",
     "lib/prism.rb",
     "lib/prism/microformat.rb",
     "lib/prism/microformat/adr.rb",
     "lib/prism/microformat/geo.rb",
     "lib/prism/microformat/hcard.rb",
     "lib/prism/microformat/rellicense.rb",
     "lib/prism/microformat/reltag.rb",
     "lib/prism/microformat/votelinks.rb",
     "lib/prism/microformat/xfn.rb",
     "lib/prism/microformat/xmdp.rb",
     "lib/prism/microformat/xoxo.rb",
     "lib/prism/microformat/hcalendar.rb",
     "lib/prism/microformat/hresume.rb",
     "lib/prism/pattern.rb",
     "lib/prism/pattern/abbr.rb",
     "lib/prism/pattern/datetime.rb",
     "lib/prism/pattern/typevalue.rb",
     "lib/prism/pattern/url.rb",
     "lib/prism/pattern/valueclass.rb",
     "lib/prism/posh.rb",
     "lib/prism/posh/anchor.rb",
     "lib/prism/posh/base.rb",
     "lib/prism/posh/definition_list.rb",
     "prism.gemspec",
     "test/fixtures/hcard/commercenet.html",
     "test/fixtures/hcard/geo.html",
     "test/fixtures/huffduffer.html",
     "test/fixtures/likeorhate.html",
     "test/fixtures/rel_license.html",
     "test/fixtures/test-fixture/hcard/hcard1.html",
     "test/fixtures/test-fixture/hcard/hcard11.html",
     "test/fixtures/test-fixture/hcard/hcard12.html",
     "test/fixtures/test-fixture/hcard/hcard17.html",
     "test/fixtures/test-fixture/hcard/hcard2.html",
     "test/fixtures/test-fixture/hcard/hcard3.html",
     "test/fixtures/test-fixture/hcard/hcard4.html",
     "test/fixtures/test-fixture/hcard/hcard5.html",
     "test/fixtures/test-fixture/hcard/hcard6.html",
     "test/fixtures/test-fixture/hcard/hcard7.html",
     "test/fixtures/test-fixture/hcard/hcard8.html",
     "test/fixtures/test-fixture/hcard/hcard9.html",
     "test/fixtures/test-fixture/hcard/hcard99.html",
     "test/fixtures/test-fixture/value-class-date-time/value-dt-test-YYYY-MM-DD--HH-MM.html",
     "test/fixtures/test-fixture/value-class-date-time/value-dt-test-abbr-YYYY-MM-DD--HH-MM.html",
     "test/fixtures/xfn.html",
     "test/fixtures/xmdp.html",
     "test/fixtures/xoxo.html",
     "test/microformat/adr_test.rb",
     "test/microformat/geo_test.rb",
     "test/microformat/hcard_test.rb",
     "test/microformat/rellicense_test.rb",
     "test/microformat/reltag_test.rb",
     "test/microformat/votelinks_test.rb",
     "test/microformat/xfn_test.rb",
     "test/microformat/xmdp_test.rb",
     "test/microformat/xoxo_test.rb",
     "test/microformat_test.rb",
     "test/pattern/date_time_test.rb",
     "test/pattern/value_class_test.rb",
     "test/pattern_test.rb",
     "test/posh/anchor_test.rb",
     "test/posh/base_test.rb",
     "test/posh/definition_list_test.rb",
     "test/prism_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/mwunsch/prism}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Ruby microformat parser and HTML toolkit}
  s.test_files = [
    "test/microformat/adr_test.rb",
     "test/microformat/geo_test.rb",
     "test/microformat/hcard_test.rb",
     "test/microformat/rellicense_test.rb",
     "test/microformat/reltag_test.rb",
     "test/microformat/votelinks_test.rb",
     "test/microformat/xfn_test.rb",
     "test/microformat/xmdp_test.rb",
     "test/microformat/xoxo_test.rb",
     "test/microformat_test.rb",
     "test/pattern/date_time_test.rb",
     "test/pattern/value_class_test.rb",
     "test/pattern_test.rb",
     "test/posh/anchor_test.rb",
     "test/posh/base_test.rb",
     "test/posh/definition_list_test.rb",
     "test/prism_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 0"])
  end
end

