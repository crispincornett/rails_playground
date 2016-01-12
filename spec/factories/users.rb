FactoryGirl.define do
  factory :user do
    client
    email { Faker::Internet.email }
    password 'password123'
    password_confirmation 'password123'
  end

  factory :super_admin, class: User do
    client
    email { Faker::Internet.email }
    password 'secret123'
    password_confirmation 'secret123'
    super_admin true
  end
end
