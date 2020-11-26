FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1234Ab' }
    password_confirmation { password }
    first_name            { Gimei.first.kanji }
    family_name           { Gimei.last.kanji }
    first_name_kana       { Gimei.first.katakana }
    family_name_kana      { Gimei.last.katakana }
    birth_day             { Faker::Date.birthday(min_age: 12, max_age: 80) }
  end
end
