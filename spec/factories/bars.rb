# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bar do
    name "MyString"
    price 1.5
    latitude 1.5
    longitude 1.5
    address "MyString"
    start_happy "2014-04-04 22:41:32"
    end_happy "2014-04-04 22:41:32"
    price_happy 1.5
  end
end
