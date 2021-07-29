# クックパッドサマーインターンシップ 2021 3日目 事前準備

インターンシップ3日目は Ruby on Rails を使った演習を行います。
当日の進行を円滑に進めるため、以下の開発環境の準備をお願いします。

- Ruby
- Docker

MacBook の貸し出しを受けた方は、原則として貸し出しの MacBook で準備を進めてください。
macOS 以外でも後述の動作確認ができていれば演習を進めることは可能ですが、当日開発環境のトラブルがあったとき必ずしもサポートできるとは限りません。

## 開発環境の準備（macOS）

### Homebrew

https://brew.sh/ の指示にしたがって、Homebrew をインストールしてください。

また、Apple M1 チップの macOS では、`brew` コマンドの PATH がデフォルトで通りません。
インストール時のログから `Next steps:` 以下の指示にしたがって PATH を通してください。
zsh を使用している場合は次のように指示されるはずです。

```
- Run these two commands in your terminal to add Homebrew to your PATH:
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/YOUR-NAME/.zprofile
    eval "\$(/opt/homebrew/bin/brew shellenv)"
```

### Ruby

Homebrew を使って最新の Ruby をインストールします。

```console
$ brew install ruby
```

インストールできたら、Homebrew でインストールした Ruby をシステムの Ruby より優先させるため、PATH を更新します。
インストール時、以下の文言のあとに PATH を更新するためのコマンドが表示されているはずなので、それを実行してください（見逃した場合は `brew info ruby` で確認できます）。

```
If you need to have ruby first in your PATH, run:
```

実行したら、シェルを再起動して Ruby のバージョンを確認してください。
2021-08-01 時点の最新バージョンは 3.0.2 です。

```console
$ ruby -v
ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [arm64-darwin20]
```

### MySQL

Ruby の MySQL クライアントライブラリのビルドに必要なため、Homebrew で MySQL をインストールします。

```console
$ brew install mysql
```

### Docker Desktop for Mac

https://docs.docker.com/docker-for-mac/install/ から Docker Desktop for Mac をインストールしてください。

また、Apple M1 チップの macOS の場合は、以下のコマンドで Rosetta 2 もインストールします。

```console
$ softwareupdate --install-rosetta
```

インストールできたら、`mysql:5.7` と `node:16-slim` のイメージをダウンロードしておいてください。

```console
$ docker pull mysql:5.7 --platform linux/amd64
$ docker pull node:16-slim
```

## 動作確認

以下のコマンドを1つずつ実行して、最後に `0 failures, 0 errors` と表示されていれば動作確認は完了です。

```console
$ git clone https://github.com/sankichi92/cookpad-summer-internship-2021-day3-setup.git
$ cd cookpad-summer-internship-2021-day3-setup
$ gem install bundler
$ bundle config force_ruby_platform true # Apple M1 チップの macOS で必須
$ bundle install
$ ruby env_test.rb
Run options: --seed 31653

# Running:

..

Finished in 0.012576s, 159.0331 runs/s, 238.5496 assertions/s.  
2 runs, 3 assertions, 0 failures, 0 errors, 0 skips
```

macOS で mysql2 gem のビルドに失敗する場合は、以下のコマンドを実行後、再度 `bundle install` からやり直してみてください。

```console
$ bundle config --local build.mysql2 --with-opt-dir="$(brew --prefix openssl)"
```

いずれかのコマンドが失敗して解決できない場合は、事前に Slack でお知らせください。
