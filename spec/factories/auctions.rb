FactoryGirl.define do
  factory :auction do
    starts_at "2015-12-21 20:19:52"
    ends_at "2015-12-21 21:19:52"
    time_zone_id "#{ Faker::Address.time_zone }"
    physical_address { "#{ Faker::Address.street_address } #{ Faker::Address.city } #{ Faker::Address.postcode }" }
    name "#{ Faker::Company.name } #{ Faker::Company.suffix } Charity Auction"
    donation_window_ends_at "2015-12-20 19:19:52"
  end
end
