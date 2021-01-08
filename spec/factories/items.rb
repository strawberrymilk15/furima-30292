FactoryBot.define do
  factory :item do
    association :user
    association :purchase
  end
end