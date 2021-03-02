class PurchaseForm
  include ActiveModel::Model

  attr_accessor :address_number,:prefecture_id,:municipalities,:address,:building_name,:phone_number,:token,:user_id,:item_id

  with_options presence: true do

   validates :municipalities,:address,:token,:user_id,:item_id

   validates :prefecture_id,numericality: { other_than: 0}

   validates :address_number,format:{with:  /\A\d{3}[-]\d{4}\z/}

   validates :phone_number,format:{with:  /\A\d{11}\z/}

  end
  def save
    purchase=Purchase.create(user_id: user_id,item_id: item_id)
    Address.create(address_number: address_number,prefecture_id: prefecture_id,municipalities: municipalities,address: address,building_name: building_name,phone_number: phone_number,purchase_id: purchase.id)
  end
end