# README

# テーブル設計


## users テーブル

| Column           | Type   | Options                                |
| ---------------- | ------ | -------------------------------------- |
| nickname         | string | null: false                            |
| email            | string | null: false, unique: true, index: true |
| password         | string | null: false                            |
| first_name       | string | null: false                            |
| family_name      | string | null: false                            |
| first_name_kana  | string | null: false                            |
| family_name_kana | string | null: false                            |
| birth_day        | date   | null: false                            |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column          | Type       | Options                                |
| --------------- | ---------- | -------------------------------------- |
| item_image      |            | activestorege                          |
| name            | string     | null: false, unique: true, index: true |
| introduction    | text       | null: false                            |
| category        | string     | null: false                            |
| item_condition  | string     | null: false                            |
| postage_payer   | string     | null: false                            |
| prefecture_code | integer    | null: false                            |
| preparation_day | string     | null: false                            |
| price           | integer    | null: false                            |
| user_id         | references | null: false, foreign_key: true         |

### Association

- belongs_to :user
- has_one    :order


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_id   | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :destination


## destinations テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| post_code       | integer(7) | null: false                    |
| prefecture_code | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | integer    | null: false, unique: true      |
| building_name   | string     |                                |
| phone_number    | integer    | null: false, unique: true      |
| order_id        | references | null: false, foreign_key: true |


### Association

- belongs_to :order