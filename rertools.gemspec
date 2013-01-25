# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rertools/version'

Gem::Specification.new do |gem|
  gem.name          = "rertools"
  gem.version       = Rertools::VERSION
  gem.authors       = ["Hiro White"]
  gem.email         = ["hiro@agoristradio.com"]
  gem.description   = %q{Reality Exploit Roundtable Full stack episode publishing.}
  gem.summary       = %q{Command line tool: retrieve show notes, inject mp3 id3v2 tags, upload file, post episode info to website.}
  gem.homepage      = "https://github.com/AgoristRadio/rertools"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
