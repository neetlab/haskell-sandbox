# やったこと
MITライセンスに基づいて内容の保証はしません

## インストール
### Haskell
Homebrewにあった`haskell-stack`というフォーミュラーからStackの最新版をインストールしました。StackはJSでいうとNVMとYarnが合体したパッケージマネージャーみたいな感じだと思います。

```
brew install haskell-stack
```

GHCの最新版は8.4.3でした。

```
$ stack ghc -- --version
The Glorious Glasgow Haskell Compilation System, version 8.4.3
```

**編集:** コンパイラーの利用
```
$ echo 'main = putStrLn "hello, world"' > hello.hs
$ stack ghc -- --make hello.hs
$ ./hello
```

### Cabal
後述の [Haskell IDE Engine](#haskell-ide-engine)のインストールに必要なため、Cabalというパッケージマネージャーをインストールします。

```
stack install cabal-install
```

バージョンを確認。2.2.0.0でした。

```
$ cabal --version
cabal-install version 2.2.0.0
compiled using version 2.2.0.1 of the Cabal library
```

念の為プレインストールされているパッケージを更新します。

```
cabal update
```

### Haskell IDE Engine
Haskell IDE Engine (HIE) は Visual Studio Code や Vim などのテキストエディタ向けにLanguage Serverを提供するソフトウェアで、GitHubでソースコードが公開されています。[^1]

任意のディレクトリにソースコードをcloneします。リポジトリーに含まれるサブモジュールもcloneするため `--recurse-submodules` オプションを渡してください。

```
git clone https://github.com/haskell/haskell-ide-engine.git --recurse-submodules
```

> ^ README.mdには `--recursive` と書いてあったけど Git 2.13 から紛らわしさのために非推奨になっています。

全バージョン向けのHIEをビルドしてインストールする方法がオススメと書いてありましたが、ありえないほどビルドに時間がかかる上にディスク容量を取られるので最新版だけでいいと思います。

GHC最新版 (8.4.3) 向けは以下でstackにインストールできます。

```
cd <haskell-ide-engineをcloneしたディレクトリ>
stack install
```

バイナリ実行ファイルがインストールされたディレクトリがシステム環境変数 `PATH` に含まれていない場合、任意のシェルの任意の設定ファイルに任意の書き方で追加してください。

私の場合、Fish shell を使っていて HIEは `~/.local/bin` にインストールされましたので、 `~/.config/fish/config.fish` に以下のように書きます。

```fish
set -x PATH ~/.local/bin $PATH
```

バージョンを確認します。GHCのバージョンと相違がないか確認してください。

```
$ hie --version
Version 0.2.2.0, Git revision 881f2b3b737c34f72fffa3bec94f08f256f0d6fe (2000 commits) x86_64 ghc-8.4.3
```

### ドキュメント生成
エディターでコードをホバーしたときに TypeScript とか Rust みたいに超丁寧な説明が出てくるやつをやるために Haddock と Hoogle というツールを使わなくちゃいけないらしいです。

#### Haddock
Haddock は Haskell のドキュメント生成ツールで、JavaDoc みたいにコード内にインラインでマジックコメントすることでドキュメントが書けるやつです。

Stackで生成したプロジェクトからHaddockを生成するには以下のコマンドを実行します。 `--keep-going` オプションで途中で無効なコメントがあっても中断しないようにします。

```
stack haddock --keep-going
```

生成されたドキュメントは `./stack-work` 内に保存されるようです。

#### Hoogle
Hoogle は Haskell版Googleといったところで、関数名とかからパッケージを検索したり補完できるみたいです。HIEではHaddockが無かった場合のフォールバックとして利用されています。

以下のコマンドでHoogleの検索用データベースを生成できるそうです。

```
stack exec hoogle generate
```

生成されたデータベースは `~/.hoogle` 内に保存されました。

## Visual Studio Codeの設定
HIEを見つけてくれなかったので手動でpathを指定しました。
![screenshot](https://i.imgur.com/dfyM0oa.png)

<!-- REFERENCIES -->
[^1]: https://github.com/haskell/haskell-ide-engine

