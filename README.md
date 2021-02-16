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
- has_many :purchases

## items テーブル

| Column                     | Type          | Options               |
|----------------------------|---------------|-----------------------|
| name                       | string        | null: false           |
| category_id                | integer       | null: false           |
| price                      | integer       | null: false           |
| product_condition_id       | integer       | null: false           |
| description_of_item        | text          | null: false           |
| shipping_charge_id         | integer       | null: false           |
| prefecture_id              | integer       | null: false           |
| date_of_shipment_id        | integer       | null: false           |
| user                       | reference     | foreign_key: true     |

### Association

- belongs_to :user
- has_one  :purchase


## purchases テーブル

| Column                     | Type          | Options               |
|----------------------------|---------------|-----------------------|
| user                       | reference     | foreign_key: true     |
| item                       | reference     | foreign_key: true     |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :address

## addresses テーブル

| Column                     | Type          | Options               |
|----------------------------|---------------|-----------------------|
| address_number             | string        | null: false           |
| prefecture_id              | integer       | null: false           |
| municipalities             | string        | null: false           |
| address                    | string        | null: false           |
| building_name              | string        |
| phone_number               | string        | null: false           |
| purchase                   | reference     | foreign_key: true     |

### Association

- belongs_to :purchase 