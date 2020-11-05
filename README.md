
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