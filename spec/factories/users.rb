FactoryBot.define do
  factory :user do
    Faker::Config.locale = :ja
    nickname       { Faker::Name.initials(number: 5) }
    email          { Faker::Internet.email }
    password       { 'furima41494' }
    password_confirmation { password }
    last_name      { '佐藤' }
    first_name     { 'さち' }
    last_name_kana { 'サトウ' }
    first_name_kana { 'サチ' }
    birth_date { Faker::Date.birthday }
  end
end
