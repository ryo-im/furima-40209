FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end
    nickname           {Faker::Name.initials(number: 2)}
    email              {Faker::Internet.email}
    password           {'1a' + Faker::Internet.password(min_length: 4)}
    encrypted_password {password}
    last_name          {person.last.kanji}
    first_name         {person.first.kanji}
    last_name_katakana {person.last.katakana}
    first_name_katakana{person.first.katakana}
    birth_date         {Faker::Date.birthday(min_age: 20, max_age: 90)}
  end
end