FactoryGirl.define do
  factory :user do
    # Use British values
    Faker::Config.locale = 'en-GB'

    name { Faker::Name.name }
    mobile_phone_number { Faker::PhoneNumber.cell_phone }
    email_address { Faker::Internet.email }
    physical_address { "#{ Faker::Address.street_address } #{ Faker::Address.city } #{ Faker::Address.postcode }" }
  end

end
