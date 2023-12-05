FactoryBot.define do
    factory :seller do
      name { Faker::Name.name }
      address { Faker::Address.street_address }
      company { Faker::Company.name }
      phone_number { Faker::PhoneNumber.phone_number }
      association :customer, factory: :customer
    end
  end