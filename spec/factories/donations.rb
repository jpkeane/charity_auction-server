FactoryGirl.define do
  factory :donation do
    title "MyString"
    description "MyText"
    quantity 1
    auction nil
    bid_type nil
    donor nil
    redemption_window_starts_at "2015-12-22 15:07:52"
    redemption_window_ends_at "2015-12-22 15:07:52"
    estimated_value_dollars 1
    minimum_bid_dollars 1
    display_description "MyString"
    admin_follow_up_needed false
    fulfillment_type 1
  end
end
