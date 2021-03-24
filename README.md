# アプリケーション名

Rails 勉強会

# アプリケーションの概要

Rails 勉強会では Rails を勉強し始めたてのかたや、Rails が好きな方を対象に自身の考えや開発中での疑問点やエラーなどを公開し共有するための学習コミュニティーアプリケーションです。また Ruby の基礎的な知識も Ruby のドキュメントを用意しているので初心者の方でも気軽に参加することができます。

# URL

https://my-portfolio-34785.herokuapp.com/

# テスト用アカウント

・メールアドレス: yamada@tarou.org
・パスワード: password

# 利用方法

ログインしていない状態だとユーザーの投稿を一覧することができ Ruby を学ぼうをクリックすると Ruby の基礎を学ぶことができます。
ログイン状態であればコンテンツを投稿したり特定のユーザーを検索したりコンテンツに対してのコメントをすることが可能になります。

# 目指した課題解決

Rails 勉強会では駆け出しエンジニアの方やプログラミング初学者を対象にし、その方々が利用しやすいような空間を作りたいと考えました。そのために Ruby を学ぼうというドキュメントを作ることで初学者にも入りやすい環境を目指しました。

# 洗い出した要件

| 機能                             | 目的                                                   | 詳細                                                                             | ストーリー（ユースケース）                                                                                                                       |
| -------------------------------- | ------------------------------------------------------ | -------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| DB 設計                          | 必要なカラムを明示的に示すため                         | README.md ファイルに記述し、ER 図の作成                                          |                                                                                                                                                  |
| ユーザーログイン、ログアウト機能 | ログインしている時としていないときで表示を変えたいから | Devise を導入して実装                                                            | トップページから新規登録はこちらボタンをクリックして、登録を行う                                                                                 |
| 投稿一覧ページ                   | 投稿した内容を表示するため                             | スタイリングと、投稿機能の実装後に DB から全ての投稿データをアクションに送る     | ログインしていれば、トップページがユーザーの投稿機能なので、投稿ができる。ログインしていなければ閲覧のみ                                         |
| ユーザー一覧機能                 | 全てのユーザーを表示するため                           | DB から全てのユーザーデータをアクションに送る                                    | ログイン状態であれば、ヘッダーの全てのユーザーボタンをクリックすると表示される。ユーザー検索機能も使える                                         |
| コンテンツ投稿機能               | コンテンツのテキストや画像を保存するため               | 投稿ページを作成し、ActiveStorage を使って画像を保存する                         | コンテンツ欄に文字を打ち込み、ファイルを選択の欄に画像を選択します                                                                               |
| コメント投稿機能                 | コンテンツに対してのコメントをするため                 | ログインしているユーザーはコメントができ、投稿一つ一つにコメントするボタンがある | ログインしていれば、投稿一覧画面の投稿一つ一つにコメントするというボタンがあるのでそれをクリックして、コメント欄に記入をして保存ボタンをクリック |

# 実装した機能についての GIF と説明

・ログインしていない状態でのトップページ
https://gyazo.com/ac7d1f0db6737bc2a25801445ac4456e
・ログイン機能
https://gyazo.com/34189c7968ccd5cd696ad30a6958fa7c
・ログアウト機能
https://gyazo.com/e482a5de14222df2200d7467c34bcfde
・ユーザー一覧機能
https://gyazo.com/88eaea6ded88ee65bfe7148ad6c4da39
・コンテンツ投稿機能
https://gyazo.com/ae9ab4de91fdc6c60fc585197c07e817
・コメント機能
https://gyazo.com/eb38a5624505622506ccc20f462e8d6a

# テーブル設計

## ER 図

https://gyazo.com/2cadb5edfde5614c87bfab26ee33f7fb

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :posts
- has_many :comments

## posts テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| posts  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :posts

# ローカルでの動作方法

開発環境：
ruby '2.6.6'
rails '~> 6.0.0'
mysql2 '>= 0.4.4'

```
git clone https://github.com/HIRONOBU-NAKAMURA/my-portfolio-34785.git

rails db:create

rails db:migrate

rails server
```
