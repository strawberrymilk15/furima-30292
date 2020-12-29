# テーブル設計

## users テーブル

| Column                     | Type          | Options               |
|----------------------------|---------------|-----------------------|
| nickname                   | string        | null: false           |
| email                      | string        | null: false,unique: true|
| encrypted_password         | string        | null: false           |
| first_name                 | string        | null: false           |
| last_name                  | string        | null: false           |
| first_name_kana_notation   | string        | null: false           |
| last_name_kana_notation    | string        | null: false           |
| birth_day                  | date          | null: false           |

### Association

- has_many :items
- has_one  :purchases

## items テーブル

| Column                     | Type          | Options               |
|----------------------------|---------------|-----------------------|
| name                       | string        | null: false           |
| category                   | string        | null: false           |
| price                      | integer       | null: false           |
| product_condition          | string        | null: false           |
| shipping_charge            | string        | null: false           |
| shipment_source_id         | integer       | null: false           |
| date_of_shipment           | string        | null: false           |
| user                       | reference     |
| description_of_item        | text          | null: false

### Association

- belongs_to :user
- has_one  :purchases


## purchases テーブル

| Column                     | Type          | Options               |
|----------------------------|---------------|-----------------------|
| user                       | reference     |
| item                       | reference     |

### Association

- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column                     | Type          | Options               |
|----------------------------|---------------|-----------------------|
| address_number             | string        | null: false           |
| prefecture_id              | integer       | null: false           |
| municipalities             | string        | null: false           |
| address                    | string        | null: false           |
| building_name              | string        |
| phone_number               | string        | null: false           |
| purchases                  | reference     |

### Association

- belongs_to :purchases