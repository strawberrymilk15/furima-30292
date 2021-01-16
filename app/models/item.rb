class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :date_of_shipment
  belongs_to :prefecture
  belongs_to :product_condition
  belongs_to :shipping_charge

  validates :name, :price, :description_of_item, :image, presence: true

  validates :category_id, :date_of_shipment_id, :prefecture_id, :product_condition_id, :shipping_charge_id, numericality: { other_than: 0} 

  belongs_to :user
  has_one_attached :image
end
