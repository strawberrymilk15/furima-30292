# テーブル設計

## users テーブル

| Column                     | Type          | Options               |
|----------------------------|---------------|-----------------------|
| nickname                   | string        | null: false           |
| email                      | string        | null: false           |
| password                   | string        | null: false           |
| password_confirmation      | string        | null: false           |
| first_name                 | string        | null: false           |
| last_name                  | string        | null: false           |
| first_name_kana_notation   | string        | null: false           |
| last_name_kana_notation    | string        | null: false           |
| birthday                   | string        | null: false           |

### Association

- has_many :items
- has_many :comments
- has_many :address
- has_one  :purchases

## items テーブル

| Column                     | Type          | Options               |
|----------------------------|---------------|-----------------------|
| name                       | string        | null: false           |
| category                   | string        | null: false           |
| price                      | string        | null: false           |
| product_condition          | string        | null: false           |
| shipping_charge            | string        | null: false           |
| shipment_source            | string        | null: false           |
| date_of_shipment           | string        | null: false           |
| image                      |               |
| user                       | reference     |

### Association

- has_many :comments
- belongs_to :user
- has_one  :purchases
- has_one  :address


## comments テーブル　

| Column                     | Type          | Options               |
|----------------------------|---------------|-----------------------|
| text                       | text          | null: false           |
| item                       | reference     |
| user                       | reference     |

### Association

- belongs_to :user
- belongs_to :item


## purchases テーブル

| Column                     | Type          | Options               |
|----------------------------|---------------|-----------------------|
| card_number                | string        | null: false           |
| card_deadline              | string        | null: false           |
| security_code              | string        | null: false           |

### Association

- belongs_to :item
- belongs_to :user

## address テーブル

| Column                     | Type          | Options               |
|----------------------------|---------------|-----------------------|
| address_number             | string        | null: false           |
| prefecture                 | string        | null: false           |
| municipalities             | string        | null: false           |
| address                    | string        | null: false           |
| building_name              | string        | null: false           |
| phone_number               | string        | null: false           |


### Association

- belongs_to :item
- belongs_to :user