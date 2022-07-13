# テーブル設計

## users テーブル

| Column                                       | Type   | Options     |
| -------------------------------------------- | ------ | ----------- |
| nickname                                     | string | null: false |
| email                                        | string | null: false, unique: true |
| encrypted_password                           | string | null: false |
| english(family_name,first_name)              | text   | null: false |
| chinese_characters(family_name,first_name)   | text   | null: false |
| hiragana(family_name,first_name)             | text   | null: false |
| kana(family_name,first_name)                 | text   | null: false |
| date_of_birth                                | string | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| item_name           | string     | null: false                   |
| text                | text       | null: false                   |
| category            | text       | null: false                   |
| situation           | text       | null: false                   |
| days                | text       | null: false                   |
| price               | string     | null: false                   |
| delivery_burden     | text       | null: false                   |
| shipping_area       | text       | null: false                   |
| user                | references | null: false, foreign_key: true|

### Association

- belongs_to :users
- has_one :buyers

## buyers テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :shopping information

## shopping information  テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefectures      | text       | null: false                    |
| municipalities   | text       | null: false                    |
| address          | text       | null: false                    |
| building_name    | text       | null: false                    |
| phone_number     | string     | null: false                    |
| buyer            | references | null: false, foreign_key: true |

### Association

- belongs_to :buyers
