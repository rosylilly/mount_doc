# -*- encoding: utf-8 -*-
require File.expand_path('../lib/mount_doc/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Sho Kusano"]
  gem.email         = ["rosylilly@aduca.org"]
  gem.description   = %q{Supporting Build APIs on Rails}
  gem.summary       = %q{Railsで書かれたアクションにコメントを書くと、動的にドキュメントを生成し、その結果をRailsアプリにマウントする}
  gem.homepage      = "https://github.com/rosylilly/mount_doc"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "mount_doc"
  gem.require_paths = ["lib"]
  gem.version       = MountDoc::VERSION

  gem.add_dependency('rails', '~> 3.2')
  gem.add_dependency('github-markup', '~> 0.7')
  gem.add_dependency('slim', '~> 1.2')
  gem.add_dependency('yard', '~> 0.8')
  gem.add_dependency('coderay', '~> 1.0')
end
