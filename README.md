# アプリ名
ユーザー管理型チャットアプリケーション

# 概要
ユーザーの権限を設定することでユーザー管理ができます。そして、チャットでの禁止ワードを設定することも可能です。
# 本番環境

# 作成背景
犯罪などの発言を防ぐため、そういった発言が投稿された場合、伏字にすることで事件を抑止できると考えて作成しました。
# DEMO
![禁止投稿された際の動き](https://user-images.githubusercontent.com/71618045/98666060-d1acf280-238f-11eb-9391-574a3d9a7f41.gif)
# 工夫したポイント
カリキュラムで学んだCHATAPPをベースに複数人で参加できるチャットアプリにすることとBLACKLISTを作成することで禁止ワードを作成することができました。
# 使用技術(開発環境)
devise
active_hash
pry-rails
mini_magick
image_processing

# テーブル設計

## usersテーブル

| Column   | Type    | Options                 |
| -------- | ------- | ----------------------- |
| name     | string  | null: false             |
| email    | string  | null: false             |
| password | string  | null: false             |
| role_id  | integer | null: false, default: 1 |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## rooms テーブル

| Column | Type    | Options     |
| ------ | ------- | ----------- |
| name   | string  | null: false |
| master | integer | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :room

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- belongs_to :user

## blacklist

| Column | Type    | Options                    |
| ------ | ------- | -------------------------- |
| word   | string  | null: false                |
| flag   | boolean | null: false, default: true |