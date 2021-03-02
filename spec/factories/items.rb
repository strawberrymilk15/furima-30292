FactoryBot.define do
  factory :item do

   name {Faker::Commerce.product_name}
   price {8000}
   description_of_item {Faker::Lorem.sentence}
   category_id {2}
   date_of_shipment_id {2}
   prefecture_id {2}
   product_condition_id {2}
   shipping_charge_id {2}

   association :user, factory: :user # アソシエーション


   after(:build) do |item|
    item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
   end

  end
end
