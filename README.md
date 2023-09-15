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
URL: https://i.gyazo.com/d205ac67380856d5e7b0b9896bb12831.png

# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | -------| ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_histories

## itemsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item_name      | string     | null: false                    |
| category_id    | integer    | null: false                    |
| condition_id   | integer    | null: false                    |
| ship_method_id | integer    | null: false                    |
| ship_area_id   | integer    | null: false                    |
| ship_day_id    | integer    | null: false                    |
| description    | text       | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_history

## purchase_historiesテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :customer_address

## customer_addressesテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | -------------------------      |
| buyer           | references | null: false, foreign_key: true |
| post_code       | string     | null: false                    |
| ship_area_id    | string     | null: false                    | 
| city            | string     | null: false                    |
| block           | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |

### Association

- belongs_to :purchase_history