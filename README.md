# テーブル設計

## users テーブル

| Column                 | Type   | Options     |
| ---------------------- | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false, unique: true |
| encrypted_password     | string | null: false |
| last_name              | string | null: false |
| first_name             | string | null: false |
| last_name_kana         | string | null: false |
| first_name_kana        | string | null: false |
| date_of_birth          | date   | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column                 | Type       | Options                       |
| ---------------------- | ---------- | ----------------------------- |
| item_name              | string     | null: false                   |
| price                  | integer    | null: false                   |
| item_text              | text       | null: false                   |
| category_id            | integer    | null: false                   |
| product_condition_id   | integer    | null: false                   |
| delivery_burden_id     | integer    | null: false                   |
| prefecture_id          | integer    | null: false                   |
| days_to_ship_id        | integer    | null: false                   |
| user                   | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :buyer

## buyers テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shopping 

## shopping   テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipalities   | text       | null: false                    |
| address          | text       | null: false                    |
| building_name    | text       |                                |
| phone_number     | string     | null: false                    |
| buyer            | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
