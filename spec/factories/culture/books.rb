FactoryGirl.define do
  factory :book, class: Culture::Book do
    user
    title         { Faker::Lorem.words(2).join(" ").titleize }
    description   { Faker::Lorem.paragraph }
  end
end