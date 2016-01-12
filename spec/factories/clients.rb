FactoryGirl.define do
  factory :client do
    short_name    { Faker::Company.name.split(' ')[0].gsub(/,/, '').downcase }
    full_name     { Faker::Company.name }
  end
end