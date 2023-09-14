# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# ER図
URL: https://i.gyazo.com/15216163bcfd2ddbada7867ba203f23b.png

# テーブル設計

## usersテーブル

| Column          | Type   | Options                   |
| --------------- | -------| ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| profile         | text   | null: false               |
| birthday        | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_histories
- has_many :customer_address

## itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | -------------------------      |
| item_id     | integer    | null: false                    |
| buyer_id    | references | null: false, foreign_key: true |
| seller_id   | references | null: false, foreign_key: true |
| item_name   | string     | null: false                    |
| category    | string     | null: false                    |
| description | text       | null: false                    |
| price       | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :purchase_histories
- has_one :customer_address

## purchase_historiesテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | -------------------------      |
| buyer_id | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |
| quantity | integer    | null: false                    |
| price    | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :items
- has_one :customer_address

## customer_addressテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | -------------------------      |
| buyer_id        | references | null: false, foreign_key: true |
| name            | string     | null: false                    |
| post_code       | string     | null: false                    |
| prefecture_name | string     | null: false                    | 
| city            | string     | null: false                    |
| block           | string     | null: false                    |
| building        | string     | null: false                    |
| phone_number    | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :items
- has_one :purchase_histories