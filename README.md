# MountDoc

Railsアプリケーション組み込み型ドキュメント生成ツール

## Configure

config/initialzier/mount_doc.rb に書き込み

- `auto_mount`: 自動でマウントするか否か(default: false)
- `auto_mount_path`: 自動でマウントする先のパス(default: /doc)
- `visible_components`: インデックスに表示する種類(default: [:files, :urls, :controllers])
- `doc_file_path`: 静的ドキュメントファイルがあるパス(default: doc)
- `markup`: コメントサマリの書式(default: rdoc)
  - 違うものを指定する場合はそれに応じたgemの導入が必要
    - `markdown`: gem install github-markdown

## Installation

Add this line to your application's Gemfile:

    gem 'mount_doc'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mount_doc

And then generate initializer file

    rails generator mount_doc:install

And added config/routes.rb

    mount MountDoc::Engine => '/prefix'

access to http://localhost:3000/prefix !


## Usage

1. Installation
2. Mount
3. Configure

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
