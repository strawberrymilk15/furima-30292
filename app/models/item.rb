class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions

belongs_to_active_hash :prefecture
belongs_to_active_hash :category
belongs_to_active_hash :product_condition
belongs_to_active_hash :shipping_charge
belongs_to_active_hash :date_of_shipment

belongs_to :user, optional: true

validates :prefecture, presence: true