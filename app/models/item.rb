class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :date_of_shipment
  belongs_to :prefecture
  belongs_to :product_condition
  belongs_to :shipping_charge

  validates :name, :description_of_item, presence: true

  validates :images, presence: true, unless: :was_attached?

  validates :price, numericality:{ with: /\A[0-9]+\z/,greater_than_or_equal_to: 300 , less_than_or_equal_to: 9999999 }


  validates :category_id, :date_of_shipment_id, :prefecture_id, :product_condition_id, :shipping_charge_id, numericality: { other_than: 0} 

  belongs_to :user
  has_many_attached :images
  has_one :purchase

  def was_attached?
    self.images.attached?
  end
end
