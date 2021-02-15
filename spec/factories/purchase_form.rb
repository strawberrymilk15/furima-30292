FactoryBot.define do
  factory :purchase_form do

    address_number {"100-0014"}
    prefecture_id {13}
    municipalities {"千代田区"}
    address {"永田町"}
    phone_number {"12345678912"}

    token {"tok_501199290762d71a5f366bb3ee7c"}
    
    association :user,factory: :user
    association :item,factory: :item

  end
end
