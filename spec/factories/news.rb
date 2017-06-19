FactoryGirl.define do
  factory :news do
    key "MyString"
    content "MyText"
    source "YahooNews"
    label nil
  end
end
