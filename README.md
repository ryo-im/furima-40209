# テーブル設計

## users テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| nickname       | string  | null: false |
| email          | string  | null: false, unique: true |
| password       | string  | null: false |
| name_kanji     | string  | null: false |
| name_katakana  | string  | null: false |
| birth_date     | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null: false |
| description         | text       | null: false |
| category            | string     | null: false |
| condition           | string     | null: false |
| delivery_charge     | string     | null: false |
| shipping_source     | string     | null: false |
| days_until_shipping | string     | null: false |
| price               | integer    | null: false |
| user_id             | references | null: false, foreign_key: true |
| purchase_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchases

## purchases テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user_id   | references | null: false, foreign_key: true |
| items_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- has_one :addresses

## addresses テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| post_code      | integer    | null: false |
| prefectures    | string     | null: false |
| municipalities | string     | null: false |
| street_address | string     | null: false |
| building       | string     | null: false |
| phone_number   | integer    | null: false |
| purchase_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases