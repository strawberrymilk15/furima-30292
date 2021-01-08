FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    first_name  {Gimei.first.kanji}
    last_name  {Gimei.last.kanji}
    first_name_kana_notation  {Gimei.first.katakana}
    last_name_kana_notation  {Gimei.last.katakana}
    birth_day {Faker::Date.backward}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end
