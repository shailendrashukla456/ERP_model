FactoryBot.define do
    factory :customer do
        name { Faker::Name.name }
        address { Faker::Address.street_address }
        company { Faker::Company.name }
        phone_number { Faker::PhoneNumber.phone_number }
    end
  end